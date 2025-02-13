# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="labymodlauncher"
_electron=29
pkgname="${_name}-electron"
pkgver=2.1.10
pkgrel=1
pkgdesc="A launcher for LabyMod, a Minecraft client that adds a bunch of useful features"
arch=('x86_64')
url="https://www.labymod.net"
license=('custom:Proprietary')
depends=("electron${_electron}" 'sh' 'libsecret')
provides=("${_name}")
conflicts=("${_name}")
_pkgsrc="${_name}-${pkgver}"
noextract=("${_pkgsrc}-x86_64.deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::https://releases.r2.labymod.net/launcher/linux/x64/${_pkgsrc//-/_}_amd64.deb"
               "${_name}.sh")
sha256sums_x86_64=('3404d3d8d7b64000c6fe9dbdef49768b279d67715b97a6be88f685838a4f0342'
                   'caa798b1fc3c0da7f726dc9bd716a10c1a94c25822bd7d5f0e4ea54dff2692b6')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*
}

build() {
  cd "${srcdir}"
  sed -e "s|@electronversion@|${_electron}|g" \
      -e "s|@appname@|${_name}|g" \
      -e "s|@runname@|app|g" \
      -e "s|@cfgdirname@|${_name}|g" \
      -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
      -i "${_name}.sh"

  cd "${_pkgsrc}-${CARCH}/usr"
  rm -rf "bin" "share"/{doc,lintian}

  cp -f "lib/${_name}/resources/icons/icon.png" "share/pixmaps/${_name}.png"

  cd "lib/${_name}"
  find . -mindepth 1 -maxdepth 1 ! -name 'resources' -exec \
    rm -rf "{}" +
  mv -f "resources"/* .
  rm -rf "resources"

  find . -type f -name '*.js' -exec \
    sed -i "s|process.resourcesPath|\"/usr/lib/${_name}\"|g" "{}" +
}

package() {
  cd "${srcdir}"
  cp -vr --no-preserve=ownership "${_pkgsrc}-${CARCH}"/* "${pkgdir}"

  install -vDm755 "${_name}.sh" "${pkgdir}/usr/bin/${_name}"
}
