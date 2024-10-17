# Maintainer: Moeta Yuko <loli at yuko dot moe>
# Contributor: Xyne <gro xunilhcra enyx, backwards>
_pkgname=reflector
pkgname=$_pkgname-cacheserver
pkgver=2023
pkgrel=2
pkgdesc='Patched version of reflector to make use of the cache server support introduced in Pacman 6.1.0.'
arch=(any)
license=(GPL2)
url="https://xyne.dev/projects/reflector"
provides=($_pkgname)
conflicts=($_pkgname)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('rsync: rate rsync mirrors')
backup=(etc/xdg/reflector/reflector.conf)
source=(https://xyne.dev/projects/reflector/src/reflector-2023.tar.xz{,.sig}
        cacheserver.patch)

sha512sums=('11aec550c15080695525409f11eae6d4b545df8b37a8e0727de939eefec2b2fa6aa95c5c3500a6c8a940b6060cdaf2526430ed47e01a3c6f098e1b77189eb479'
            'SKIP'
            'cb9966b0dc9c4f9710972873d3d5030ccb26f1eeca074501046d19039836aa13300e1aa4b976fcebdbdce4737564e5df4e2caa4060f351d169380418aaca2f8c')
b2sums=('24ee3610eb94e4412bceba40f4763def380028683358cb1016546a4d0bb12eaa69aba4e83b7998ebb74ee6f025f9f342901d076e44302da47d0ed14b727fb9c1'
        'SKIP'
        '5c4a6710b3f094d9ed56e176ed84e75c04cc06bf789dcec7aedd1e691072c63e22d177ff8766e956875ff8648aee0b332d2f2080dcbfeb512900caf5974980ad')
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ../cacheserver.patch
}

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package ()
{
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "man/${_pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
  install -Dm644 'reflector.service' "$pkgdir/usr/lib/systemd/system/reflector.service"
  install -Dm644 'reflector.timer' "$pkgdir/usr/lib/systemd/system/reflector.timer"
  install -Dm644 'reflector.conf' "$pkgdir/etc/xdg/reflector/reflector.conf"
}


# vim: set ts=2 sw=2 et:
