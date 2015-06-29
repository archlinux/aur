# Maintainer: sumito3478 <sumito3478@gmail.com>
# Contributor: sumito3478 <sumito3478@gmail.com>
# Contributor: rbellamy <rbellamy@pteradigm.com>
pkgname=sbt-extras-git
pkgver=20140505
pkgrel=1
pkgdesc="An alternative script for running sbt"
arch=('any')
url="https://github.com/paulp/sbt-extras"
license=('BSD' 'custom' 'Apache')
depends=('java-runtime-headless' 'bash')
makedepends=('git' 'wget')
provides=('sbt')
conflicts=('sbt')

_gitroot=git://github.com/paulp/sbt-extras.git
_gitname=sbt-extras

source=("$_gitname::$_gitroot")

sha256sums=('SKIP')

build() {
  # dynamically get the default version of sbt
  cd "$srcdir/$_gitname"
  sbt_version=$(bash sbt -help | grep -- '-sbt-version' | head -1 | grep -Eo '\(default: [^\)]*' | cut '-d ' -f2)
  msg "default sbt version used by sbt-extras is $sbt_version"
  sbt_launch_repo=$(bash sbt -help | grep -- '-sbt-launch-repo' | head -1 | grep -Eo '\(default: [^\)]*' | cut '-d ' -f2)

  cd "$srcdir"
  echo $sbt_version > sbt_version
  mkdir -p "sbt-$sbt_version"
  cd "sbt-$sbt_version"
  # download the default version of sbt-launch.jar
  wget -nc $sbt_launch_repo/org.scala-sbt/sbt-launch/$sbt_version/sbt-launch.jar || return 1
  # download the default version of sbt license files
  wget -nc https://raw.githubusercontent.com/sbt/sbt/v$sbt_version/LICENSE || return 1
  for lib in Apache JLine MetaScala SBinary Scala jdepend; do
    wget -nc https://raw.githubusercontent.com/sbt/sbt/v$sbt_version/licenses/LICENSE_$lib || return 1
  done
}

package() {
  sbt_version=$(cat "$srcdir/sbt_version")
  cd "$srcdir/sbt-$sbt_version"
  # install the default version of sbt-launch.jar to keep compatibility with the sbt package in Community
  install -D -m755 sbt-launch.jar "$pkgdir/usr/share/java/sbt/sbt-launch.jar" || return 1
  # install the sbt license files
  for license in LICENSE*; do
    install -D -m644 $license "$pkgdir/usr/share/licenses/sbt/$license" || return 1
  done
  cd "$srcdir/$_gitname"
  # install sbt-extras
  install -D -m755 sbt "${pkgdir}/usr/bin/sbt" || return 1
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README" || return 1
  install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt || return 1
  git reset --hard HEAD
}

# vim:set ts=2 sw=2 et:
