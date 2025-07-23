# Maintainer: meow <sosdjolfkhgsldjkfh@gmail.com>
# based on this package: https://aur.archlinux.org/packages/squirrel

pkgname=squirrel304
pkgver=3.0.4
pkgrel=1
pkgdesc="Major release 3.0.4 of the light-weight scripting language that fits in the size, memory bandwidth, and real-time requirements of applications like video games. Installs itself in /bin/squirrel304"
arch=('i686' 'x86_64')
url="http://www.squirrel-lang.org/"
license=('MIT')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/squirrel/squirrel_3_0_4_stable.tar.gz")
sha256sums=('6a3706accf9872aafea1eb3f3f3018b135e2671033824ccebf0735a98b2440a5')
# provides=('squirrel')
# conflicts=('squirrel')

prepare() {
  _sqsrc="${srcdir}/SQUIRREL3"

  mkdir "${_sqsrc}/include/${pkgname}"
  mv -v "${_sqsrc}/include/"*.h "${_sqsrc}/include/${pkgname}/"

  mkdir "${_sqsrc}/lib/${pkgname}"

  # sq/ directory
  sed -r -io -e 's/(LIBZ=.*\/lib)/\1\/'${pkgname}'/g'                                 "${_sqsrc}/sq/Makefile"
  sed -r -io -e 's/(INCZ=.*include)/\1\/'${pkgname}'/g'                               "${_sqsrc}/sq/Makefile"

  # sqstdlib/ directory
  sed -r -io -e 's/(OUT=.*\/lib)\/(libsq[a-z]*\.a)/\1\/'${pkgname}'\/\2/g'            "${_sqsrc}/sqstdlib/Makefile"
  sed -r -io -e 's/(INCZ=.*\/include)(.*Iinclude)/\1\/'${pkgname}'\2\/'${pkgname}'/g' "${_sqsrc}/sqstdlib/Makefile"

  # squirrel/ directory
  sed -r -io -e 's/(OUT=.*\/lib)\/(libsq[a-z]*\.a)/\1\/'${pkgname}'\/\2/g'            "${_sqsrc}/squirrel/Makefile"
  sed -r -io -e 's/(INCZ=.*\/include)(.*Iinclude)/\1\/'${pkgname}'\2\/'${pkgname}'/g' "${_sqsrc}/squirrel/Makefile"
}

build() {
  cd "${srcdir}/SQUIRREL3"
  # If $arch is x86_64, compile for 64bits. Else do it for 32.
  if [ $CARCH=='x86_64' ]; then
    make sq64
  else
    make sq32
  fi
}

package() {
  _sqsrc="${srcdir}/SQUIRREL3"
  cd "${_sqsrc}"

  # Install squirrel Interpreter
  install -Dm755 bin/sq "${pkgdir}"/usr/bin/$pkgname

  # Install Includes and various headers
  for _file in $(ls "${_sqsrc}/include/${pkgname}")
  do
     install -Dm644 include/${pkgname}/$_file "${pkgdir}"/usr/include/${pkgname}/$_file
  done
  # Install all static libraries & others
  for _file in $(ls "${_sqsrc}/lib/${pkgname}")
  do
     install -Dm644 lib/${pkgname}/$_file "${pkgdir}"/usr/lib/${pkgname}/$_file
  done

  # Install docs & examples.
  for _file in $(ls "${_sqsrc}"/doc)
  do
     install -Dm644 doc/$_file "${pkgdir}"/usr/share/$pkgname/doc/$_file
  done
  for _file in $(ls "${_sqsrc}"/samples)
  do
     install -Dm644 samples/$_file "${pkgdir}"/usr/share/$pkgname/samples/$_file
  done

  # Install Other docs
  install -Dm644 COPYRIGHT "${pkgdir}"/usr/share/licenses/$pkgname/COPYRIGHT
  install -Dm644 HISTORY "${pkgdir}"/usr/share/$pkgname/HISTORY
  install -Dm644 README "${pkgdir}"/usr/share/$pkgname/README
  for _file in $(ls "${srcdir}"/squirrel3/etc)
  do
    # i think this is supposed to be "embedding" instead of "embebing" ???
    # install -Dm644 etc/$_file "${pkgdir}"/usr/share/$pkgname/embebing/$_file
	install -Dm644 etc/$_file "${pkgdir}"/usr/share/$pkgname/embedding/$_file
  done
}
