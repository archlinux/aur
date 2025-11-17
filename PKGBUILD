# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Lucas Nascimento <lucasnascimento95@gmail.com>
# Contributor: Arne Hoch <arne@derhoch.de>

_pkgname=dbeaver
pkgname=dbeaver-ce-bin
pkgver=25.2.5
pkgrel=1
pkgdesc="Free universal SQL Client for developers and database administrators (community edition)"
arch=('x86_64' 'aarch64')
url="https://dbeaver.io/"
license=("Apache-2.0")
depends=('java-runtime>=17' 'gtk3' 'gtk-update-icon-cache' 'libsecret')
conflicts=('dbeaver')
provides=('dbeaver')
source=("${_pkgname}-${pkgver}.linux.gtk.${CARCH}-nojdk.tar.gz"::"https://github.com/dbeaver/dbeaver/releases/download/${pkgver}/dbeaver-ce-${pkgver}-linux.gtk.${CARCH}-nojdk.tar.gz"
        "io.dbeaver.DBeaver.desktop"
        "${pkgname}.sh"
        "${pkgname}.install")
sha256sums=('00317bb855198f329a4d0140b6a1b43bcd5893c4af061f3a4acc883a24a9d5f6'
            '9480a7d08f680e10c399db070c5a04cbabf282442602a2ef83d1159fe7c3e88b'
            '406a2980806c394670e88b1ae70134900be376c2ea4a4216610591cc8b557526'
            '603f7aa912685b69ca558ca7586585b7a314ca1b743be574db7bcd7a31c2ea2d')
install="${pkgname}.install"

prepare() {
  cd "dbeaver/plugins/com.sun.jna_5.17.0.v20250316-1700/com/sun/jna"
  for _dir in aix-ppc aix-ppc64 darwin-aarch64 darwin-x86-64 \
    dragonflybsd-x86-64 freebsd-aarch64 freebsd-x86 freebsd-x86-64 \
    linux-aarch64 linux-x86-64 linux-arm linux-armel linux-loongarch64 linux-mips64el \
    linux-ppc linux-ppc64le linux-riscv64 linux-s390x linux-x86 \
    openbsd-x86 openbsd-x86-64 \
    sunos-sparc sunos-sparcv9 sunos-x86 sunos-x86-64 \
    win32 win32-aarch64 win32-x86 win32-x86-64
  do
    if [[ "linux-${CARCH//_/-}" != "${_dir}" ]]; then
      rm -r "${_dir}"
    fi
  done
}

package() {
  # Initially install everything into /usr/lib/dbeaver
  install -m 755 -d "${pkgdir}/usr/lib"
  cp -r "dbeaver" "${pkgdir}/usr/lib/${_pkgname}"

  # Move shared data to /usr/share/dbeaver
  cd "${pkgdir}/usr/lib/${_pkgname}"
  rm "dbeaver-ce.desktop"
  install -m 755 -d "${pkgdir}/usr/share/${_pkgname}"
  for _file in configuration features p2 .eclipseproduct dbeaver.ini readme.txt
  do
    mv "${_file}" "${pkgdir}/usr/share/${_pkgname}"
    ln -s "/usr/share/${_pkgname}/${_file}" .
  done

  # Install additional licenses
  install -m 755 -d "${pkgdir}/usr/share/licenses"
  mv licenses "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/licenses/${pkgname}" "${pkgdir}/usr/lib/${_pkgname}/licenses"

  # Install icons
  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  mv dbeaver.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  mv icon.xpm "${pkgdir}/usr/share/pixmaps/${_pkgname}.xpm"

  # Install executable script into /usr/bin
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/dbeaver"

  # Install application launcher into /usr/share/applications
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${srcdir}/io.dbeaver.DBeaver.desktop"
}
