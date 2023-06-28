# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=outline
pkgver=0.69.2
pkgrel=1
pkgdesc="Wiki and knowledge base for growing teams"
arch=('x86_64')
url="https://www.getoutline.com"
license=('BSL')
makedepends=('npm' 'nodejs')
optdepends=('redis' 'postgresql')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/outline/outline/archive/v${pkgver}.tar.gz"
	"outline.service"
	"outline.sysusers")
sha512sums=('ce529f92d3d022addfe7045bf3d98319f8eeaaed2753d98787d013a337f6d0e484f358974a53e8133603c87a2051c55ed2a1aafcfc52e466bf400575766cbb18'
            '24c91cb7e88b75fc785f6c49c5a80460085ff329e7b7ce4be60059205d6e2aef07d61aad91d038ecfb8265eace4d21f1e6a6abf678bafcf13244f285b35c56d6'
            'a9849e480b280e04d58e949a1b0f4daa548cd8e2ee3e567524ebe5b04815211294a16aadffa6c7f02e1be87dd13120fad6a551abd040d827a84b42945965efb3')
backup=('usr/share/webapps/outline/.env')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm i
  npm run build:webpack
}

package() {
  install -d "${pkgdir}/usr/share/webapps/outline"
  install -d "${pkgdir}/etc/webapps/outline"

  cp -r "${srcdir}/${pkgname}-${pkgver}/." "${pkgdir}/usr/share/webapps/outline/"

  cp "${pkgdir}/usr/share/webapps/outline/.env.sample" "${pkgdir}/usr/share/webapps/outline/.env"
  ln -s "/usr/share/webapps/outline/.env" "${pkgdir}/etc/webapps/outline/.env"

  install -Dm 644 "${srcdir}/outline.service" "${pkgdir}/usr/lib/systemd/system/outline.service"
  install -Dm 644 "${srcdir}/outline.sysusers" "${pkgdir}/usr/lib/sysusers.d/outline.conf"
}
