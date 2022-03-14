# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=apptainer-git
pkgver=1.0.0.r137.ga7df110a8
pkgrel=1
pkgdesc="Application containers for Linux"
arch=('i686' 'x86_64')
url="https://apptainer.org/"
license=('BSD')
depends=('glibc' 'libseccomp' 'squashfs-tools')
makedepends=('git' 'cryptsetup' 'go')
provides=('apptainer' 'singularity-container')
conflicts=('apptainer' 'singularity-container')
backup=('etc/singularity/capability.json'
        'etc/singularity/cgroups/cgroups.toml'
        'etc/singularity/ecl.toml'
        'etc/singularity/global-pgp-public'
        'etc/singularity/network/00_bridge.conflist'
        'etc/singularity/network/10_ptp.conflist'
        'etc/singularity/network/20_ipvlan.conflist'
        'etc/singularity/network/30_macvlan.conflist'
        'etc/singularity/network/40_fakeroot.conflist'
        'etc/singularity/nvliblist.conf'
        'etc/singularity/remote.yaml'
        'etc/singularity/rocmliblist.conf'
        'etc/singularity/seccomp-profiles/default.json'
        'etc/singularity/singularity.conf')
source=("git+https://github.com/apptainer/apptainer.git"
        "tmpfiles.conf::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/singularity-container/trunk/tmpfiles.conf")
sha256sums=('SKIP'
            'SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

prepare() {
  cd "apptainer"

  # fix bash completion path
  sed \
    -e "s|/etc/bash_completion.d|/usr/share/bash-completion/completions|" \
    -e "s|\$(SYSCONFDIR)/bash_completion.d|/usr/share/bash-completion/completions|" \
    -i "mlocal/frags/build_cli.mk"

  sed -i "s|singularity|apptainer|" "$srcdir/tmpfiles.conf"
}

pkgver() {
  cd "apptainer"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "apptainer"

  # provide version to build script
  echo "$pkgver" > VERSION

  ./mconfig \
    --prefix="/usr" \
    --sysconfdir="/etc" \
    --libexecdir="/usr/lib" \
    --localstatedir="/var/lib" \
    -P release-stripped
  make -C "builddir"
}

package() {
  cd "apptainer"

  make -C "builddir" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/apptainer"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/apptainer"

  # let systemd-tmpfiles generate state directory
  rm -rf "$pkgdir/var"
  install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/apptainer.conf"
}
