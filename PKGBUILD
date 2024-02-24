# Maintainer: picokan <todaysoracle@protonmail.com>
# Contributor: Plague-doctor <plague at privacyrequired dot com >

pkgname=freetube
_pkgname=FreeTube
pkgver=0.19.2
pkgrel=1
pkgdesc='An open source desktop YouTube player built with privacy in mind.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('AGPL3')
depends=( 'electron')
makedepends=('yarn')
url=https://freetubeapp.io
source=(https://github.com/FreeTubeApp/FreeTube/archive/v$pkgver-beta.tar.gz
        package-only-necessary.diff
        freetube.desktop
        freetube.sh)
sha256sums=(21c4c05eb1e2e8a95d7d1b94a150a6535616c82a17a6f0ad60a974ec03e3c3b0
			37c478db10a9d2c8d9cab91039304fc533324bbd926465b594936fb871894e8f
            ada2b4b8f6a1e8896acbce4f4d311228d2c86026c273ffa00afa3247294f8b1e
			3f4951c6cdb33cc1c4df05606760197efe45321519c259e47656077d6df2af18)

prepare() {
  patch "$srcdir/$_pkgname-$pkgver-beta/_scripts/build.js" < package-only-necessary.diff
}

build() {
  cd "$srcdir/$_pkgname-$pkgver-beta"
  yarn --cache-folder "${srcdir}/yarn-cache" install
  yarn --cache-folder "${srcdir}/yarn-cache" run build
}

package() {
  install -d "${pkgdir}"/usr/lib/${pkgname}
  cp -R "./$_pkgname-$pkgver-beta/build/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname"
  install -Dm755 "./freetube.sh" "$pkgdir/usr/bin/$pkgname"
  
  cd $_pkgname-$pkgver-beta
  install -Dm644 "./_icons/icon.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  cd ..
  install -Dm644 "freetube.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
