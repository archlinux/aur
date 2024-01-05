# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=k3s-git
pkgver=1.29.0+k3s1+r0+g3190a5faa2
pkgrel=1
pkgdesc='Lightweight Kubernetes'
arch=(x86_64)
url='https://k3s.io'
license=(Apache)
makedepends=(
  git go podman
  # these are (some of) the tools that are installed into the "builder"
  # docker container during the officially blessed build path
  # curl jq yq zstd pigz
)
provides=(k3s)
conflicts=(k3s)
backup=(
  etc/systemd/system/k3s.service.env
  etc/systemd/system/k3s-agent.service.env
  etc/rancher/k3s/config.yaml
)
source=(
  "git+https://github.com/k3s-io/k3s"
  'k3s.service.env'
  'k3s-agent.service.env'
  'config.yaml'
  '0001-main-apply-go-fmt-to-pkg-data-zz_generated_bindata.g.patch'
  '0002-.dockerignore-do-not-ignore-parts-of-GITDIR.patch'
  '0003-Dockerfile.dapper-sanitize-DAPPER_OUTPUT.patch'
  '0004-Dockerfile.dapper-sanitize-cache-configuration.patch'
  '0005-.service-update-systemd-service-files.patch'
  '0006-scripts-moar-compression-drop-pigz-and-raw-tar.patch'
)
sha256sums=('SKIP'
            '94b0dd21fa4f075d4db7f6efe7a775de476b278de72f99773ee3de0bb54e7f68'
            '2f6964aed46deb38095801e124a6603f3a29e6886815d52c59c02883f7a37925'
            '6f0500a656ed78c0bb689c12264dbcd79f579edc3b9e17d512be742c1b2c43a4'
            'a9414087c64788cdca41da004e967e07649a49b1738dc321f5eea0784f659fd2'
            '508567cfcbe586fb37b13597ab6dcc54054c38c545572b4ad430b92fbad42b6d'
            'cc821200609eff8ceca746f4ada46e09e32c3d680be411d3bbe52f23a580edb6'
            '5436f98a1058bd7a2f385e42f0ffb23806fa8b5f41bf43b17706a2bf4dd1eaf0'
            '9eb251530ef9bb81b667ce07bc811876dead9d2ae5e748ea7351bcb719bb5c3d'
            '7ea31aab59fc7268dfa1f97daa209d8b94f2f6c9e19248bc80d2c5b9b05bbccf')

pkgver() {
  cd k3s
  git describe --long --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd k3s

  # fix #8293, #9089, sanitize buildsystem, moar compression
  for p in "${source[@]}"; do
    if [[ $p == *.patch ]]; then
      git am -3 "$srcdir/$p"
    fi
  done
}

build() {
  # 1. Make a `docker` -> `podman` wrapper that does not complain to stderr
  cat >docker <<"EOF"
#!/bin/sh
exec podman "$@"
EOF
  chmod +x docker
  export PATH="$PWD:$PATH"

  # 2. Point podman to a default registry of some sort
  # (pulled from https://github.com/containers/podman/blob/main/test/registries.conf)
  cat >registries.conf <<"EOF"
unqualified-search-registries = ['docker.io', 'quay.io', 'registry.fedoraproject.org']

[[registry]]
# In Nov. 2020, Docker rate-limits image pulling.  To avoid hitting these
# limits while testing, always use the google mirror for qualified and
# unqualified `docker.io` images.
# Ref: https://cloud.google.com/container-registry/docs/pulling-cached-images
prefix="docker.io"
location="mirror.gcr.io"
EOF
  export CONTAINERS_REGISTRIES_CONF="$PWD/registries.conf"

  # 3. Point podman to a suitably neutered containers.conf to prevent various failures.
  cat >containers.conf <<"EOF"
[containers]
default_sysctls = []
EOF
  export CONTAINERS_CONF="$PWD/containers.conf"

  # 4. Run podman-system-service to create a dockerd-compatible control socket
  # and point every broken tool in existence towards it.
  # (Do not run podman-system-service if one is already available.)
  if [[ -e /var/run/docker.sock ]]; then
    :
  elif [[ -e /run/user/$UID/podman/podman.sock ]]; then
    export DOCKER_HOST="unix:///run/user/$UID/podman/podman.sock"
  else
    export DOCKER_HOST="unix://$PWD/docker.sock"
    podman system service --time 0 "$DOCKER_HOST" >&2 &
    podman_pid="$!"

    _kill_podman() {
      trap - EXIT
      if [[ $podman_pid ]]; then
        msg2 "Stopping podman service instance (PID ${podman_pid})..."
        kill "$podman_pid"
        wait "$podman_pid"
        podman_pid=
      fi
    }
    trap _kill_podman EXIT
  fi

  # 5. Set $DAPPER_CACHE_HOME to hopefully persist (some) caches
  # FIXME: point this to $HOME after we make sure this works
  export DAPPER_CACHE_HOME="$BUILDDIR/dapper-cache"
  # dapper/podman won't create those subdirs for us
  mkdir -pv "$DAPPER_CACHE_HOME"/{cache,go/pkg}

  # 6. create a build script with only the steps we want
  cat <<"EOF" | install -m755 /dev/stdin k3s/scripts/archpkg
#!/bin/bash -ex

scripts/download
scripts/build
scripts/package-cli
#REPO=... IMAGE_NAME=... scripts/package-image
scripts/package-airgap
EOF

  # 7. Hopefully run the build inside of this Rube-Goldbergian contraption.
  cd k3s
  #scripts/archpkg
  make archpkg

  # 8. Stop the podman-system-service instance.
  if command -v _kill_podman &>/dev/null; then
    _kill_podman
  fi
}

package() {
  cd k3s

  install -Dm755 \
    dist/artifacts/k3s \
    -t "$pkgdir/usr/bin"

  install -Dm644 \
    k3s.service \
    k3s-agent.service \
    -t "$pkgdir/usr/lib/systemd/system"

  install -Dm644 \
    k3s-rootless.service \
    k3s-agent-rootless.service \
    -t "$pkgdir/usr/lib/systemd/user"

  install -Dm600 \
    "$srcdir/k3s.service.env" \
    "$srcdir/k3s-agent.service.env" \
    -t "$pkgdir/etc/systemd/system"

  install -Dm600 \
    "$srcdir/config.yaml" \
    -t "$pkgdir/etc/rancher/k3s"

  # air-gapped images
  install -Dm644 \
    dist/artifacts/k3s-airgap-images-amd64.tar.zst \
    dist/artifacts/k3s-images.txt \
    -t "$pkgdir/var/lib/rancher/k3s/agent/images"

  install -Dm644 \
    LICENSE \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
