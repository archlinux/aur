# Maintainer: Oliver Emery <thrymgjol at gmail dot com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Andrew Wright <andreww@photism.org>
# Contributor: Paul Mattal <paul@archlinux.org>

# Includes fix for https://bz.apache.org/bugzilla/show_bug.cgi?id=63874

pkgbase=ant-git
pkgname=('ant-git' 'ant-git-doc')
pkgver=1.10.8alpha
pkgrel=1
pkgdesc='Java based build tool'
url='https://ant.apache.org/'
arch=('any')
license=('APACHE')
makedepends=('git' 'bash' 'java-environment' 'junit' 'java-hamcrest')
source=('git+https://gitbox.apache.org/repos/asf/ant#commit=2f0e194b8a18f094d2a9e47e34e16544ced55245'
        'ant.conf')
sha256sums=('SKIP'
            '23bbef577b56d48adb1985dbd9795e5533146646f1e8bb879dd061a4014ffcf2')

_gitname='ant'

_replace_lib() {
  # explicitly call rm to ensure we replace instead of add
  rm "$2"
  ln -s "$1" "$2"
}

prepare() {
  cd "${_gitname}"
  sed -i 's|/usr/bin/python|/usr/bin/python2|' src/script/runant.py
}

build() {
  cd "${_gitname}"
  export JAVA_HOME=/usr/lib/jvm/default
  ./bootstrap.sh
  bootstrap/bin/ant -Ddest=optional -f fetch.xml
  _replace_lib /usr/share/java/junit.jar lib/optional/junit-4.12.jar
  _replace_lib /usr/share/java/hamcrest-core.jar lib/optional/hamcrest-core-1.3.jar
  _replace_lib /usr/share/java/hamcrest-library.jar lib/optional/hamcrest-library-1.3.jar
  bootstrap/bin/ant dist
}

package_ant-git() {
  depends=('java-environment' 'bash')
  optdepends=('junit: junit tasks'
              'java-hamcrest: junit tasks')
  provides=('apache-ant' 'ant')
  conflicts=('apache-ant' 'ant')
  backup=('etc/ant.conf')

  cd "${_gitname}/apache-ant-${pkgver}"
  local _ant_home=/usr/share/ant

  install -d "${pkgdir}${_ant_home}"
  cp -Rp etc "${pkgdir}${_ant_home}"

  find bin -type f -a ! -name \*.bat -a ! -name \*.cmd \
    -exec install -Dm 755 {} -t "${pkgdir}${_ant_home}/bin" \;
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/share/ant/bin/ant "${pkgdir}/usr/bin/ant"

  install -Dm 644 "${srcdir}/ant.conf" -t "${pkgdir}/etc"
  install -Dm 644 lib/*.jar -t "${pkgdir}/usr/share/java/ant"
  ln -s /usr/share/java/ant "${pkgdir}${_ant_home}/lib"

  install -Dm 644 ../{LICENSE,NOTICE} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_ant-git-doc() {
  pkgdesc='Apache Ant build tool documentation'
  provices=('apache-ant-doc' 'ant-doc')
  conflicts=('apache-ant-doc' 'ant-doc')

  install -d "${pkgdir}/usr/share/doc/ant"
  cp -r "${_gitname}/apache-ant-${pkgver}/manual/"* "${pkgdir}/usr/share/doc/ant"
}
