# Maintainer: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>
pkgname=apkanalyser
pkgver=5.2
pkgrel=2
pkgdesc="Powerful tool to analyse your APKs"
arch=(i686 x86_64)
url="http://developer.sonymobile.com/wp/2012/04/13/powerful-tool-to-analyse-your-apks-now-released-open-source/"
license=('APACHE')
provides=('apkanalyser')
conflicts=('apkanalyser-git')
depends=('java-runtime')
makedepends=('maven' 'git')
source=('apkanalyser.sh' 'apkanalyser.desktop')

md5sums=('8c179b61dd1c8d5417242df5d72835b3'
         '986540ff04cfdf84ce0b30732174eabe')

_gitroot=git://github.com/sonyxperiadev/ApkAnalyser.git
_gitname=ApkAnalyser


build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # Build smali project
  cd smali
  mvn install

  # Build apktool project
  cd ../apktool
  mvn install

  # Install jgraphx into local Maven repository
  cd ../apkanalyser
  mvn install:install-file -Dfile=lib/jgraphx.jar -DgroupId=com.mxgraph -DartifactId=jgraphx -Dversion=1.7.1.9 -Dpackaging=jar -DgeneratePom=true

  # Build and package ApkAnalyser
  mvn assembly:assembly
}

package() {
  cd "$srcdir/$_gitname-build"
  install -D -m644 apkanalyser/target/apkanalyser-*-exec.jar ${pkgdir}/usr/bin/apkanalyser.jar
  install -D -m755 ${srcdir}/apkanalyser.sh ${pkgdir}/usr/bin/apkanalyser
  install -D -m644 ${srcdir}/apkanalyser.desktop ${pkgdir}/usr/share/applications/apkanalyser.desktop
}

# vim:set ts=2 sw=2 et:
