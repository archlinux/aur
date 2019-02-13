# Maintainer: Christian Bundy <christianbundy@fraction.io>

pkgname=ssb-patchwork-git
_srcname=patchwork
_aurname=ssb-patchwork
pkgver=3.10.1.r301.g9750bc4d
pkgrel=1
pkgdesc="A decentralized messaging and sharing app built on top of Secure Scuttlebutt (SSB)"
arch=('i686' 'x86_64')
url="https://github.com/ssbc/patchwork"
license=('AGPL3')
depends=('libxtst' 'libxext' 'libxkbfile' 'gconf' 'libsodium' 'libxss' 'gtk2' 'alsa-lib' 'nss' 'electron2')
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
'ab36b2c19104e7c9848e9db23dccd8db82d26299ba90005b37f60fcf93cd6b67879f0b428bd75b5902fe055ace349127c76e94dfcacf8414008a5fbdd8cae813'
'09292ec2f7c02d741cbeb046bd99293f4d144314d0233252dd34a619e1aacbbbf28078677c0871d367240e29aa50d9197bbe0a35e5b14f7ff9a6288c386124f6'
)

pkgver() {
  cd "${_srcname}"

  # https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=linux-git&id=e03e86d03543561336930472671ffa3e8b8e8cbd#n34
  git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\.rc/rc/'
}


build() {
    cd "${srcdir}/${_srcname}"
    # Electron's version.
    export npm_config_target=$(electron2 -v)
    # The architecture of Electron, can be ia32 or x64.
    export npm_config_arch=x64
    export npm_config_target_arch=x64
    # Download headers for Electron.
    export npm_config_disturl=https://atom.io/download/electron
    # Tell node-pre-gyp that we are building for Electron.
    export npm_config_runtime=electron
    # Tell node-pre-gyp to build module from source code.
    export npm_config_build_from_source=true

    npm install --only=production
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
