# Maintainer: dreieck
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
_pkgname=eilin
pkgname="${_pkgname}-hg"
pkgver=date20170101_r216.a713d4319273
pkgrel=4
pkgdesc="Utility to control EIZO monitors under Linux."
arch=('i686' 'x86_64')
url="http://sourceforge.net/p/eilin/home/Home/"
license=('GPL3')
depends=(
  'expat'
  'libusb'
)
makedepends=(
  'cmake'
  'mercurial'
  'qt5-base'
)
optdepends=('qt5-base: For the GUI')
provides=(
  "${_pkgname}"
  "qeilin-hg"
  "qeilin"
  "${_pkgname}-doc-hg"
  "qeilin-doc-hg"
  "${_pkgname}-doc"
  "qeilin-doc"
  "libusbpp-hg"
  "testhid-hg"
  "libusbpp"
  "testhid"
)
conflicts=(
  "${_pkgname}"
  "qeilin-hg"
  "qeilin"
  "${_pkgname}-doc-hg"
  "qeilin-doc-hg"
  "${_pkgname}-doc"
  "qeilin-doc"
  "libusbpp-hg"
  "testhid-hg"
  "libusbpp"
  "testhid"
)
options=('!emptydirs') # Remove empty dirs, because some top spurious level directories of ${srcdir} would be left over in the package otherwise.
install="${_pkgname}.install"
source=(
  "${_pkgname}::hg+http://hg.code.sf.net/p/eilin/mercurial"
  "libusbpp.pc.in"
  "${install}"
  "website_main.html::http://sourceforge.net/p/eilin/home/Home/"
  "website_installation.html::http://sourceforge.net/p/eilin/home/Installation/"
  "website_usage.html::https://sourceforge.net/p/eilin/home/Usage/"
  "website_new-device-support.html::https://sourceforge.net/p/eilin/home/New%20Device%20Support/"
)
sha256sums=(
  'SKIP'
  '47167c82b3fdbbc942465d7f23d07ddf88df34411ad0c245ac61f94735a178f4'
  '733d7ab700ff73e1bce4bf1b55d5fc13a63aa4516b538458df55c525de867bef'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # _ver='latest'
  _date="$(hg log -l 1 -b . -T '{date|shortdate}' | tr -d '-')"
  _rev="$(hg identify -n)"
  _hash="$(hg identify -i)"

  # if [ -z "${_ver}" ]; then
  #   printf "%s %s." "Error in 'pkgver()': Could not determine" "version" > /dev/stderr
  #   return 11
  # fi
  if [ -z "${_date}" ]; then
    printf "%s %s." "Error in 'pkgver()': Could not determine" "latest commit date" > /dev/stderr
    return 13
  fi
  if [ -z "${_rev}" ]; then
    printf "%s %s." "Error in 'pkgver()': Could not determine" "commit count" > /dev/stderr
    return 12
  fi
  if [ -z "${_hash}" ]; then
    printf "%s %s." "Error in 'pkgver()': Could not determine" "global revision ID" > /dev/stderr
    return 14
  fi

  printf "date%s_r%s.%s" "${_date}" "${_rev}" "${_hash}"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  msg2 "Creating mercurial commit log ..."
  hg log -b . --style changelog > "ChangeLog-mercurial.txt"
}

build() {
  cd "${srcdir}/${_pkgname}"

  msg2 "Running 'cmake' ..."
  cmake . \
    -DINSTALL_SETUID=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_COLOR_MAKEFILE=ON \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
    -DCMAKE_VERBOSE_MAKEFILE=ON

  # '-lpthread' needs to be at the end of the linker flags (after '../libusbpp/install/lib/libusbpp.a'), otherwise qeilin compilation might fail with
  #    /sbin/ld: ../libusbpp/install/lib/libusbpp.a(context.cpp.o): undefined reference to symbol 'pthread_create@@GLIBC_2.2.5'
  #    /sbin/ld: /usr/lib/gcc/x86_64-pc-linux-gnu/8.2.1/../../../../lib/libpthread.so: error adding symbols: DSO missing from command line
  msg2 "Fixing 'qeilin/CMakeFiles/qeilin.dir/link.txt' ..."
  sed -E 's|(libusbpp.a)|\1 -lpthread|' -i "qeilin/CMakeFiles/qeilin.dir/link.txt"

  # 'make' does need internet connection, since it pulls in 'libusbpp' ...
  msg2 "Running 'make' (Needs internet connection )-:) ..."
  make

  msg2 "Making 'libusbpp.so' shared object ..."
  gcc ${CFLAGS} ${LDFLAGS} $(pkg-config --cflags --libs libusb-1.0) -shared -o "${srcdir}/${_pkgname}/libusbpp/install/lib/libusbpp.so" "${srcdir}/${_pkgname}/libusbpp/install/lib/libusbpp.a"

  msg2 "Generating libusbpp-pkg-config file ..."
  install -dm755 "${srcdir}/${_pkgname}/libusbpp/install/lib/pkgconfig"
  sed 's|@VERSION@|'"$(hg log --cwd "${srcdir}/${_pkgname}/libusbpp/src/libusbpp_project" -l 1 -b . -T '{date|shortdate}' | tr -d '-')"'|g' "${srcdir}/libusbpp.pc.in" > "${srcdir}/${_pkgname}/libusbpp/install/lib/pkgconfig/libusbpp.pc"
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Installation of main software.
  # 'make install' does need internet connection, since it pulls in 'libusbpp' ...
  msg2 "Running 'make install' (needs internet connection )-:) ..."
  make DESTDIR="${pkgdir}/" install

  # Moving libusbpp stuff to the right place.
  msg2 "Moving libusbpp stuff to the right place ..."
  rm "${srcdir}/${_pkgname}/libusbpp/install/lib/libusbpp.a"
  install -dvm755 "${pkgdir}/usr"
  cp -avl "${srcdir}/${_pkgname}/libusbpp/install"/{bin,include,lib} "${pkgdir}/usr"/
  rm -R "${pkgdir}/${srcdir}" # This will leave over some not-needed empty directories; 'options=(!emptydirs)' to make 'makepkg' geting rid of them.

  # Install the udev rule.
  msg2 "Installing udev rule ..."
  install -Dvm644 51-eizo.rules "${pkgdir}/usr/lib/udev/rules.d/51-eizo.rules"

  # Install documentation.
  msg2 "Inatalling documentation ..."
  for _docfile in ChangeLog-mercurial.txt NEWS NOTES README; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}/html"
  cp -vL "${srcdir}"/website*.html "${pkgdir}/usr/share/doc/${_pkgname}/html/"
  chmod 644 "${pkgdir}/usr/share/doc/${_pkgname}/html"/website*.html

  # Install license file.
  msg2 "Installing license file ..."
  install -Dvm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
