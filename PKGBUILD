# Maintainer: samarthj <dev@samarthj.com>

# shellcheck disable=2034,2148,2154

pkgbase=podman-git
pkgname=(podman-git podman-docker-git)
_pkgname=podman
_pkgname_docker=podman-docker
pkgver=4.5.0_dev.r18231.g519cfa81f
pkgrel=1
pkgdesc="Tool and library for running OCI-based containers in pods (git)"
arch=(x86_64 aarch64)
makedepends=(go go-md2man git gcc glibc btrfs-progs "catatonit>=0.1.7-2" libapparmor.so libdevmapper.so libgpgme.so libseccomp.so libsystemd.so systemd)
# https://github.com/containers/podman/issues/13297
options=(!lto)
url="https://github.com/containers/$_pkgname.git"
license=(Apache)
source=(
  "git+$url"
  "$_pkgname-4.2.0-defaultinitpath.patch"
)
sha256sums=('SKIP'
            '0f835642a5299d17be36ade891bb7bbbbb4dceef2a715e99fe0580d3a74fec82')

pkgver() {
  cd "$srcdir/$_pkgname" || exit 1
  commit=$(printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  ver=$(sed -ne 's/^var\s\+Version\s\+=\s.*("\(.*\)").*/\1/p' <"$srcdir"/"$_pkgname"/version/version.go)
  echo "${ver//-/_}.${commit}"
}

prepare() {
  # set default init_path to /usr/lib/podman/catatonit
  # https://bugs.archlinux.org/task/75493
  patch -Np1 -d $_pkgname -i ../$_pkgname-4.2.0-defaultinitpath.patch
}

build() {
  # Fails if using clang
  export CC=gcc
  export CXX=g++
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath"

  cd $_pkgname || exit 1
  make EXTRA_LDFLAGS='-s -w -linkmode=external' PREFIX=/usr
}

package_podman-git() {
  depends+=("catatonit>=0.1.7-2" conmon containers-common crun iptables libdevmapper.so libgpgme.so libseccomp.so libsystemd.so systemd slirp4netns netavark aardvark-dns)
  optdepends+=(
    'libapparmor.so: support for apparmor'
    'libselinux: support for selinux'
    'btrfs-progs: support btrfs backend devices'
    'cni-plugins: for the old cni networking implementation'
    'podman-compose: for docker-compose compatibility'
    'podman-docker: for Docker-compatible CLI'
  )
  provides=("$_pkgname" "$_pkgname-remote")
  conflicts=("$_pkgname" "$_pkgname-remote")

  cd $_pkgname || exit 1
  make install install.completions DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname[0]}/LICENSE"
  # remove man pages provided by containers-common
  rm -rvf "${pkgdir}/usr/share/man/man5"
}

package_podman-docker-git() {
  pkgdesc='Emulate Docker CLI using podman'
  depends=("$_pkgname")
  conflicts=(docker)
  provides=(docker)

  cd $_pkgname || exit 1
  make docker-docs EXTRA_LDFLAGS='-s -w -linkmode=external'
  make install.docker-full DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname[1]}/LICENSE"
}
