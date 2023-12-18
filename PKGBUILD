# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=k3s-git
pkgver=1.28.4+k3s2+r8+g231cb6ed20
pkgrel=2
pkgdesc='Lightweight Kubernetes'
arch=(x86_64)
url='https://k3s.io'
license=(Apache)
makedepends=(git go podman)
provides=(k3s)
conflicts=(k3s)
backup=(
  etc/systemd/system/k3s.service.env
)
source=(
  "git+https://github.com/k3s-io/k3s"
  'k3s.service.env'
)
sha256sums=(
  'SKIP'
  '667199fa6b811dde3aef3e626e2695a566ad64c9a03d19d0c94a1f104a7612d0'
)

pkgver() {
  cd k3s
  git describe --long --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd k3s

  # moar compression
  sed -i -r 's|(zstd .*)-[0-9]+|\1 --ultra -22|' \
    scripts/package-cli \
    scripts/package-airgap \

  sed -i -r 's|/usr/local/bin/k3s|/usr/bin/k3s|' \
    *.service
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
  export DOCKER_HOST="unix:///tmp/docker.sock"
  podman --log-level=info system service --time 0 "$DOCKER_HOST" &
  podman_pid="$!"

  # 5. Hopefully run the build inside of this Rube-Goldbergian contraption.
  cd k3s
  mkdir -p build/data
  make download
  make generate
  make build
  make package

  kill "$podman_pid"
  wait "$podman_pid"
}

package() {
  cd k3s

  install -Dm755 \
    dist/artifacts/k3s \
    -t "$pkgdir/usr/bin"

  install -Dm644 \
    k3s.service \
    -t "$pkgdir/usr/lib/systemd/system"

  install -Dm644 \
    k3s-rootless.service \
    -t "$pkgdir/usr/lib/systemd/user"

  install -Dm600 \
    "$srcdir/k3s.service.env" \
    -t "$pkgdir/etc/systemd/system"

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
