# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

pkgname=kaizen
pkgdesc="Kaizen ElasticSearch GUI"
pkgver=6.850.110
pkgrel=1
arch=('x86_64')
url='https://www.elastic-kaizen.com/'
license=('custom')
optdepends=('gtk-theme-murrine-collection')
_zip="${pkgname}-${pkgver}-linux-x64.zip"
source=("${_zip}::https://elastic-kaizen.com/install/${pkgver}/${_zip}"
        "kaizen.desktop"
        "LICENSE"
        "kaizen.png")

sha512sums=('7b974b791a0ea056962c57f14cff82d4852d295db6761fff343100f2a70866157fb0e412938856759e52c968264922ac85ec4ef9b4b40ac23faef8a7ac14351a'
            '8e055220939a3e7ff5441353dcbed4ef432b25e0aeac772e11e9a0f9b4fb9a91f8f5cd694eac6f1031cf1a6ff136cee6b43a51d07238ed5efd5491dd060799f2'
            '35e15a34c425c8af17c1141a35cec0cbea6aba65d01443fb39ceb09ff51bb30ab356192d54b33dfb953ef9ddc6e489e42067358543f129e03f9a0c4f5a041529'
            'a0277b72a04cfa7dad2ae8819fc5a009211bbbb44645cc1b7f73fb66e9473d47d5fa6273dfc977bd6746bc435e5ddc21ba28d3cb03e3f090ae6b5ac82137b913')

build() {

  # Correct kaizen.sh
  sed -e "s/jvm/\/opt\/${pkgname}\/jvm/g" -i "$srcdir/${pkgname}.sh"
  sed -e "s/${pkgname}.jar/\/opt\/${pkgname}\/${pkgname}.jar/g" -i "$srcdir/${pkgname}.sh"
  sed -e "s/bash/bash\ncd \$HOME\/.config\/kaizen/" -i "$srcdir/${pkgname}.sh"
}

package() {

  install -Dm644 "$srcdir/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -dm755 "${pkgdir}/opt"
  mkdir -p "${pkgdir}/opt/${pkgname}/"
  cp -a "${srcdir}/${pkgname}.jar" "${pkgdir}/opt/${pkgname}/"
  cp -a "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/"
  cp -a "${srcdir}/jvm" "${pkgdir}/opt/${pkgname}/"

  # hack to create config folder
  mkdir -p "$HOME/.config/${pkgname}"

  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
