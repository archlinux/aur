# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Kyle Brady  <kyle at spark-gap dot com>
# Contributor: Patrick Hof <courts@offensivethinking.org>
# Contributor: Michael Fellinger <mf@rubyists.com>

pkgname=haxe2
pkgver=2.10
pkgrel=3
pkgdesc="A multiplatform open source programming language"
arch=('i686' 'x86_64')
url='http://haxe.org/'
license=('GPL2' 'MIT')
groups=('devel')
depends=('neko>=1.8.2')
makedepends=('subversion' 'ocaml>=4.00.0' 'zlib' 'neko>=1.8.2')
provides=('haxe')
options=('!strip' 'emptydirs' '!makeflags')
install=haxe.install
source=('haxeserver'
        'haxe.sh'
        'haxe.csh'
        'extlib.patch')
	
md5sums=('27d7af131da515355cca04b8b404feaa'
         '79cbf6ebdb3d56e980d1a17fa9cb3b2d'
         '5e0e656293e92a6437d76f2f406438b5'
         'ae26bfc2ba01b870ba6ad2b3183b37af')


#_tag="http://haxe.googlecode.com/svn/tags/v${pkgver/./-}"
_tag="http://haxe.googlecode.com/svn/branches/v${pkgver/./-}-fix"

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."
  if [[ -d "$pkgname/.svn" ]]; then
    (cd "$pkgname" && svn revert libs/extlib/extHashtbl.mli && svn up)
  else
    svn co "$_tag" --config-dir ./ "$pkgname"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."
  cd $srcdir/$pkgname
  
  #
  # BUILD HERE
  #

  # clean up first
  patch -p1 < "$srcdir"/extlib.patch
  make clean > /dev/null
  for i in haxe{lib,doc}; do
   [ -f "$srcdir/$pkgname/std/tools/$i/$i" ] && rm "$srcdir/$pkgname/std/tools/$i/$i"
  done
  
  make || return 1
  msg2 "done."

  msg "Generating api docs..."  
  cd doc && env HAXE_LIBRARY_PATH=$srcdir/$pkgname/std $srcdir/$pkgname/haxe all.hxml
  if [ -f flash8.xml -a -f flash9.xml -a -f neko.xml -a -f js.xml -a \
       -f php.xml -a -f cpp.xml -a -f cs.xml -a -f java.xml ]; then 
    $srcdir/$pkgname/std/tools/haxedoc/haxedoc -v \
      "flash8.xml;flash8;flash" "neko.xml;neko" "js.xml;js" \
      "flash9.xml;flash" "php.xml;php" "cpp.xml;cpp" \
      "cs.xml;cs" "java.xml;java"
    if [ $? -eq 0 ]; then
      echo 
      msg2 "done."
    else
      echo 
      msg2 "failed." 
      return 1
    fi
  fi
}

package() {
  install --directory "$pkgdir"{/usr/{bin,lib/haxe/lib},/opt/haxe/doc,/etc/profile.d}
  install --mode=755 "$srcdir"/haxeserver "$pkgdir"/usr/bin/
  install --mode=755 "$srcdir"/haxe.{,c}sh "$pkgdir"/etc/profile.d/
  svn export --quiet $srcdir/$pkgname/std "$pkgdir"/opt/haxe/std
  install --mode=644 -D --no-target-directory $srcdir/$pkgname/doc/LICENSE.txt "$pkgdir"/usr/share/$pkgname/LICENSE.txt
  install --mode=644 $srcdir/$pkgname/doc/CHANGES.txt "$pkgdir"/opt/haxe/
  install --mode=755 $srcdir/$pkgname/haxe{,lib,doc} "$pkgdir"/usr/bin/
  cp --recursive $srcdir/$pkgname/doc/content "$pkgdir"/opt/haxe/doc/
  install --mode=644 $srcdir/$pkgname/doc/index.html "$pkgdir"/opt/haxe/doc/
}

# vim:set ts=2 sw=2 et:
