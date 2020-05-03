# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=sfntly
pkgname=${_pkgname}-git
pkgver=r204.1e7adf31
pkgrel=1
pkgdesc="A Library for Using, Editing, and Creating SFNT-based Fonts"
arch=('i686' 'x86_64')
url="https://github.com/googlefonts/sfntly"
license=('Apache')
depends=('java-environment<13' 'icu' 'bash')
makedepends=('git' 'apache-ant' 'cmake')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+https://github.com/googlefonts/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}/java"

  export ANT_OPTS="-Dfile.encoding=UTF-8"
  ant

  cd "${srcdir}/${_pkgname}/cpp"

  bsdtar xCf "ext" "ext/redist/gtest-1.6.0.zip"
  ln -s "gtest-1.6.0" "ext/gtest"
  mkdir "build"
  cd "build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_SKIP_RPATH=ON -DBUILD_SHARED_LIBS=ON
  make sfntly subsetter subtly subtly_subsetter subtly_merger subtly_debug chrome_subsetter
}

package() {
  cd "${srcdir}/${_pkgname}/java/dist"

  install -Dm644 "lib/sfntly.jar" "${pkgdir}/usr/share/java/sfntly/sfntly.jar"
  install -Dm644 "sample/sflint/sflint.jar" "${pkgdir}/usr/share/java/sfntly/sflint.jar"
  install -Dm644 "sample/sfntdump/sfntdump.jar" "${pkgdir}/usr/share/java/sfntly/sfntdump.jar"
  install -Dm644 "tools/fontinfo/fontinfo.jar" "${pkgdir}/usr/share/java/sfntly/fontinfo.jar"
  install -Dm644 "tools/sfnttool/sfnttool.jar" "${pkgdir}/usr/share/java/sfntly/sfnttool.jar"

  for tool in sflint sfntdump fontinfo sfnttool; do
    echo "#!/bin/sh" > "${tool}"
    echo "exec /usr/bin/java -jar '/usr/share/java/sfntly/${tool}.jar' \"\$@\"" >> "${tool}"
    install -Dm755 "${tool}" "${pkgdir}/usr/bin/${tool}"
  done

  mkdir "doc"
  cd "doc"
  jar xf "../lib/sfntly-javadoc.jar"
  rm -rf "META-INF"
  install -dm755 "${pkgdir}/usr/share/doc/sfntly"
  cp -a * "${pkgdir}/usr/share/doc/sfntly/"

  cd "${srcdir}/${_pkgname}/cpp/build"

  for file in {bin,lib}/*; do
    install -Dm755 "${file}" "${pkgdir}/usr/${file}"
  done
}
