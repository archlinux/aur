# Maintainer: Christian Bundy <christianbundy@fraction.io>

pkgname=ssb-patchwork-git
_srcname=patchwork
_aurname=ssb-patchwork
pkgver=3.10.1.r2.gf6309ea8
pkgrel=2
pkgdesc="A decentralized messaging and sharing app built on top of Secure Scuttlebutt (SSB)"
arch=('i686' 'x86_64')
url="https://github.com/ssbc/patchwork"
license=('AGPL3')
depends=('libxtst' 'libxext' 'libxkbfile' 'gconf' 'libsodium' 'libxss' 'gtk2' 'alsa-lib' 'nss')
makedepends=('nodejs' 'npm')
provides=("ssb-patchwork=${pkgver}")
conflicts=('ssb-patchwork')
options=(!strip)
source=(
"git+https://github.com/ssbc/${_srcname}.git"
'run.sh'
"${_aurname}.desktop"
)

sha512sums=(
'SKIP'
'bbcd812b57fbef59993db18e7ac650013afe671846f7ea7b4908e7e664508a034851b336de2593dad11d871e803e55548896d55468339d91d4d4023ea2fe3b08'
'09292ec2f7c02d741cbeb046bd99293f4d144314d0233252dd34a619e1aacbbbf28078677c0871d367240e29aa50d9197bbe0a35e5b14f7ff9a6288c386124f6'
)

pkgver() {
  cd "${_srcname}"

  # https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=linux-git&id=e03e86d03543561336930472671ffa3e8b8e8cbd#n34
  git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\.rc/rc/'
}


build() {
    cd "${srcdir}/${_srcname}"
    npm ci
    npm run rebuild
}

package() {
    cd "${srcdir}"
    install -D run.sh "${pkgdir}/usr/bin/${_aurname}"
    install -D "${_aurname}.desktop" "${pkgdir}/usr/share/applications/${_aurname}.desktop" 

    cd "${_srcname}"
    install -d "${pkgdir}/opt/${_aurname}"
    cp -a * "${pkgdir}/opt/${_aurname}"
    install -D assets/icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_aurname}.png"
}
