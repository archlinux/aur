# Maintainer: Thaodan <AUR+me@thaodan.de>
_pkgname=sdk-setup
pkgname=sailfish-$_pkgname
pkgver=1.4.59
pkgrel=1
pkgdesc="Sailfish SDK utilities patched to run on Arch, UNSUPPORTED"
arch=('any')
url="https://github.com/sailfishos/sdk-setup"
license=('GPL')
depends=(
  'sh'
  'rpm-tools'
  'createrepo_c'
  'git'
  'scratchbox2'
  'rsync'
  'sudo'
)
optdepends=(
  'compiledb: mb2 compiledb'
  'p7zip: sdk-manage install'
  'ssu: sdk-manage install'
           )
source=($pkgname::git+https://github.com/sailfishos/$_pkgname.git#tag=$pkgver)
md5sums=('SKIP')

makedepends=(
  'git'
)


# pkgver() {
#   cd "$srcdir/$pkgname"
#   printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
# }

build() {
  cd "$srcdir/$pkgname/$_pkgname/src"
  sed -e "s/VERSION_FROM_SPEC/$pkgver/" \
      -e "s|libexec/sdk-setup|lib/$pkgname|" \
      -e '/shopt\ -s\ extglob/i export\ PATH="$PATH:/bin"' \
      -i mb2
  sed -e "s/VERSION_FROM_SPEC/$pkgver/" \
      -e "s|^INSIDE_CHROOT.*|INSIDE_CHROOT=1\n export PATH=$PATH:/bin\n|" \
      -i sdk-manage
}

package() {
        cd $pkgname/$_pkgname/src
        _bindir=$pkgdir/usr/bin
        _libexec=$pkgdir/usr/lib/$pkgname
        mkdir $pkgdir/etc
        touch  $pkgdir/etc/MerSDK
        install -dm755 $pkgdir/usr/bin
        install -dm755 $pkgdir/usr/lib/$pkgname
        _install="/usr/bin/install -m755"

        $_install oomadvice $_libexec/oomadvice
        $_install git-change-log ${_bindir}/git-change-log
        $_install mb2 ${_bindir}/mb2
        $_install qb ${_bindir}/qb
        $_install sdk-foreach-su ${_bindir}/sdk-foreach-su
        $_install sdk-manage ${_bindir}/sdk-manage
        $_install sdk-assistant ${_bindir}/sdk-assistant
        $_install sdk-motd ${_bindir}/sdk-motd
        $_install rpmvalidation ${_bindir}/rpmvalidation
        $_install git-lltb ${_bindir}/git-lltb
        $_install sdk-init ${_bindir}/sdk-init
}
