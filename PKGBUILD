# Maintainer: wilke
pkgname=traccar
pkgver=6.8.1
pkgrel=0
pkgdesc="Open source GPS tracking system"
arch=('x86_64')
url="http://www.traccar.org/"
license=('APACHE')
depends=(npm makeself jdk-openjdk zip unzip)
backup=('opt/traccar/conf/traccar.xml')
conflicts=('traccar-bin')
provides=("traccar=${pkgver}")

source=("git+https://github.com/traccar/traccar.git"
	"package.patch")
sha512sums=('SKIP'
            'SKIP')

build() {
  cd traccar

  git submodule init
  git config submodule.traccar-web.url "https://github.com/traccar/traccar-web"
  git submodule update
  git checkout "v${pkgver}"

  # Build traccar-web

  cd traccar-web
  npm install
  npm run build
  cd ..

  # Build traccar-server

  ./gradlew assemble
}

package() {
  patch -Np1 -i package.patch

  cd "${srcdir}/traccar/setup"
  ./package.sh "v${pkgver}" linux-64

  ./traccar.run --noexec --target "${pkgdir}/opt/traccar/"
  install -m755 -d "${pkgdir}/usr/lib/systemd/system"
  mv "${pkgdir}/opt/traccar/traccar.service" "${pkgdir}/usr/lib/systemd/system/"
  chmod 755 -R "${pkgdir}/opt"
}
