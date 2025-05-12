# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=outline
pkgver=0.84.0
pkgrel=1
pkgdesc="Wiki and knowledge base for growing teams"
arch=('x86_64')
url="https://www.getoutline.com"
license=('BSL')
depends=('yarn' 'nodejs-lts-iron')
#makedepends=('yarn' 'nodejs-lts-iron')
optdepends=('redis' 'postgresql')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/outline/outline/archive/v${pkgver}.tar.gz"
	"outline.service"
	"outline.sysusers"
        "outline-db-create"
        "outline-db-migrate")
sha512sums=('62838a8ff78079180655ca08b2b3ef88d102a1e588fa9186c788de9ff2f7cc498c61886d4b2c39a650c44980ebcd573c38bded93ac2a507ca42a1fe8a3f48866'
            'dc980bc23336c6ea7949bf27e0a3c22a56d50bd4db8b64b9a2ab585d1afba40b2260a4d2a99d7e492fde898a58dfa31d422f27722939f92d7a643500d035ebe2'
            'a9849e480b280e04d58e949a1b0f4daa548cd8e2ee3e567524ebe5b04815211294a16aadffa6c7f02e1be87dd13120fad6a551abd040d827a84b42945965efb3'
            '69d8676411e9747f61597d26dd65afeb8942eec30a45e4e63ddea0e005b00822e25bde43460a35e04013b7e4d288bf93175eecfe9368c4a71a674a67372a915b'
            'b37208e5d061e3256591c5e07a7337be3da53ada92a5fc0a9b1f9fa62fd5fd8969a2940db45096c81b557eb3f1299be6506ec51facfb59f930b1db965cebccb0' 
    )
backup=('usr/share/webapps/outline/.env')
options=(!strip) # Stripping unneeded symbols from binaries and libraries takes a lot of time and resources
install=outline.install

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  HUSKY=0 yarn install --frozen-lockfile && yarn build
}

package() {
  install -d "${pkgdir}/usr/share/webapps/outline"
  install -d "${pkgdir}/etc/webapps/outline"

  cp -r "${srcdir}/${pkgname}-${pkgver}/." "${pkgdir}/usr/share/webapps/outline/"

  cp "${pkgdir}/usr/share/webapps/outline/.env.sample" "${pkgdir}/usr/share/webapps/outline/.env"
  ln -s "/usr/share/webapps/outline/.env" "${pkgdir}/etc/webapps/outline/config.env"
    
  install -Dm 644 "${srcdir}/outline.service" "${pkgdir}/usr/lib/systemd/system/outline.service"
  install -Dm 644 "${srcdir}/outline.sysusers" "${pkgdir}/usr/lib/sysusers.d/outline.conf"
  install -Dm 755 "${srcdir}/outline-db-create" "${pkgdir}/usr/local/bin/outline-db-create"
  install -Dm 755 "${srcdir}/outline-db-migrate" "${pkgdir}/usr/local/bin/outline-db-migrate"
}
