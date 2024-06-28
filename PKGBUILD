# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=outline
pkgver=0.77.2
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
sha512sums=('02872339ce9806c958514d3bc55602562794d8ef785fc94d020a2a1d742a918d75c2df3a18ab86a295dfc609aee833cde33e8d11158991787019971d5a4d8b89'
            'dc980bc23336c6ea7949bf27e0a3c22a56d50bd4db8b64b9a2ab585d1afba40b2260a4d2a99d7e492fde898a58dfa31d422f27722939f92d7a643500d035ebe2'
            'a9849e480b280e04d58e949a1b0f4daa548cd8e2ee3e567524ebe5b04815211294a16aadffa6c7f02e1be87dd13120fad6a551abd040d827a84b42945965efb3'
            '69d8676411e9747f61597d26dd65afeb8942eec30a45e4e63ddea0e005b00822e25bde43460a35e04013b7e4d288bf93175eecfe9368c4a71a674a67372a915b'
	    'de54ed4d5616d7f8360ca641e967444205a0272d135fcad1ca5770bf62c36c5de7781de4cffb50355f1f95c8d78647f6c0bea470e6e6e1c2626b99b67bc97e35' 
    )
backup=('usr/share/webapps/outline/.env')
options=(!strip) # Stripping unneeded symbols from binaries and libraries takes a lot of time and resources
install=outline.install

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  git init # create git repo to make husky happy https://github.com/typicode/husky/issues/851
  yarn install --frozen-lockfile && yarn build
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
