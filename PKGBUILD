# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
_relver=1.0.67
pkgname=fantom-hg
pkgver=r4214.64f424f699f4
pkgrel=1
pkgdesc="OO,functional programming language designed to cross compile to Java,.NET and JavaScript"
arch=('i686' 'x86_64')
url=https://bitbucket.org/fantom
license=('custom:AcademicFreeLicense3.0')
depends=('java-runtime')
makedepends=('mercurial' 'java-environment' 'unzip')
if  [ "$CARCH" = "x86_64" ]; then
  makedepends=(${makedepends[@]} 'swt')
fi
optdepends=('mariadb-jdbc')
options=('!purge')
install=fantom.install
source=("$pkgname::hg+https://bitbucket.org/fantom/fan-1.0"
  "https://bitbucket.org/fantom/fan-1.0/downloads/fantom-${_relver}.zip"
  LICENSE 
  fantom.profile 
  fantom.install)
md5sums=('SKIP'
         '3f505db3e8e629914d6849e8739a6477'
         '6f6f26e10fee5edcfa0dff72274e6d28'
         '24709c14c5d3b5e12e5bfd2712d7a2f4'
         'b11183f32ccf65b5f67c3d94ab2a44d1')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "$srcdir/$pkgname"
  _devhome=$PWD
  _relhome="$srcdir/fantom-$_relver"
  sed --in-place -e "#^//devHome=file:/E:/dev/fan/#devHome=$_devhome#" $_devhome/etc/build/config.props
  cd $_relhome
  chmod a+x ./bin/fan
  [ "$CARCH" = "x86_64" ] &&
    [ ! -d $_devhome/lib/java/ext/linux-x86_64 ] && 
      mkdir -p $_devhome/lib/java/ext/linux-x86_64  &&
        cp /usr/share/java/swt.jar $_devhome/lib/java/ext/linux-x86_64/
  if [ -z "$JAVA_HOME" ]; then
    JDK=$(archlinux-java get)
    [ -n "$JDK" ] && export JAVA_HOME=/usr/lib/jvm/$JDK
  fi
  # for build using JDK >= 1.7, FAN_BUILD_JAVACPARAMS must be empty
  # http://fantom.org/sidewalk/topic/1765
  export FAN_BUILD_JAVACPARAMS=;FAN_HOME=.; yes | ./bin/fan ./adm/bootstrap.fan -devHome $_devhome -skipPull
}

#check() {
#  cd "$srcdir/$pkgname"
#  FAN_HOME=.;./bin/fan ./src/buildall.fan test
#}

package() {
  pushd .
  cd "$srcdir/$pkgname"
  FAN_HOME=.
  adm/unixsetup
  bin/fan src/buildall.fan examples
  bin/fan src/buildall.fan deleteNonDist
  bin/fan src/buildall.fan readme
  _zip="fantom-$_relver.zip"
  [ -f "$_zip" ] && rm "$_zip"
  bin/fan src/buildall.fan zip
  unzip -d "$pkgdir"/opt/ "$_zip"
  rm "$_zip"
  mv "$pkgdir/opt/fantom-${_relver}" "$pkgdir"/opt/fantom
  rm "$pkgdir"/opt/fantom/bin/*.exe
  rm "$pkgdir"/opt/fantom/bin/*.dll
  chmod a+x "$pkgdir"/opt/fantom/bin/*
#  cp -R "$srcdir/$pkgname" "$pkgdir/opt/fantom"
#  rm -rf "$pkgdir/opt/$pkgname"/.hg{,tags,ignore}
  popd
  install --directory "$pkgdir"{/opt,/etc/profile.d}
  chmod a+r "$pkgdir"/opt/fantom/lib/fan/*
  install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/fantom/LICENSE
  install -Dm644 $srcdir/fantom.profile $pkgdir/etc/profile.d/fantom.sh
}

# vim:set ts=2 sw=2 et:
