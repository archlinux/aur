# Maintainer: Hansruedi Patzen <hp@revy.ch>

pkgname=tifig
_execname=runner
_basever=0.8.0
_build=2017123002054
pkgver=${_basever}.${_build}
pkgrel=1
provides=('tifig')
conflicts=('tifig')
pkgdesc='Swift IDE based on Eclipse'
arch=('x86_64')
url='https://www.tifig.net/'
license=('custom:CC-BY-SA-4.0')
depends=('swift' 'java-environment>=8' 'python')
options=(emptydirs)

source=(
  LICENSE
  ${pkgname}-${pkgver}-${CARCH}.tar.gz::'https://tifig-downloads.s3.amazonaws.com/tifig-0.8.0-201712302054-linux.gtk.x86_64.tar.gz'
)
sha512sums=(
  '6395618de74d4d432bb06175ceb8e16382f73613363b9409afebf7c5f59ab3ebd0f668fe0947f3a4b492afa8fa80146ba263470f2e2f4f10d51db328a559b9ac'
  '891de9a900c2f976ce216e8654ce8e9b29d35e1df62eb856b1b06bab2b92e76bc82db41499900b752a67dbe53e818bfb4920f2f101b0caebb43263db43987a77'
)

_libdir=/usr/lib/${pkgname}
_bindir=/usr/bin/${pkgname}

package() {
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d ${pkgdir}/${_libdir}
  bsdtar cf - --cd ${srcdir}/${pkgname}-${_basever} . | bsdtar xf - --cd ${pkgdir}/${_libdir}
  mv ${pkgdir}/${_libdir}/Tifig.ini ${pkgdir}/${_libdir}/${_execname}.ini
  rm ${pkgdir}/${_libdir}/*.so.* ${pkgdir}/${_libdir}/detect-libc ${pkgdir}/${_libdir}/tifig.sh ${pkgdir}/${_libdir}/tifig.desktop

  install -D /dev/stdin "${pkgdir}/${_bindir}" <<END
#!/usr/bin/env sh
export ECLIPSE_HOME=${_libdir}
exec \$ECLIPSE_HOME/${_execname} "\$@"
END

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<END
[Desktop Entry]
Name=Tifig
Comment=${pkgdesc}
Icon=${pkgname}
Exec=${pkgname}
Terminal=false
Type=Application
Categories=Development;IDE;Swift;
StartupNotify=true
END

  install -Dm644 "${srcdir}/${pkgname}-${_basever}/icon.xpm" "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
}

