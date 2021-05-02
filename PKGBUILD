# Maintainer: Olof Nord <aur@olof.info>

pkgname='hla-bin'
pkgver='2.16'
pkgrel='1'
pkgdesc='The High-Level Assembler for the 80x86 CPU'
arch=('x86_64' 'i686')
url="https://www.plantation-productions.com/Webster/HighLevelAsm"
license=('GPL-2')
source=("https://www.plantation-productions.com/Webster/HighLevelAsm/HLAv$pkgver/linux.hla.tar.gz")
sha256sums=('6c9a7773ed12a27d8ab4871e4b64544a56936db23c067230168f26178af2815c')

package() {
  cd "$srcdir/usr"

  install -D -m 755 "$pkgname/delete" "$pkgdir/usr/bin/$pkgname/delete"
  install -D -m 755 "$pkgname/hla" "$pkgdir/usr/bin/$pkgname/hla"
  install -D -m 755 "$pkgname/hlacmp" "$pkgdir/usr/bin/$pkgname/hlacmp"
  install -D -m 755 "$pkgname/hlaparse" "$pkgdir/usr/bin/$pkgname/hlaparse"
  install -D -m 755 "$pkgname/makefile" "$pkgdir/usr/bin/$pkgname/makefile"
  install -D -m 755 "$pkgname/mkMake" "$pkgdir/usr/bin/$pkgname/mkMake"

  for file in $(find $pkgname/hlalib/ -type f -printf "%f\n"); do
    install -D -m 644 $pkgname/hlalib/$file "$pkgdir/usr/bin/$pkgname/hlalib/$file";
  done

  for file in $(find $pkgname/include/ -maxdepth 1 -type f -printf "%f\n"); do
    install -D -m 644 $pkgname/include/$file "$pkgdir/usr/bin/$pkgname/include/$file";
  done

  for file in $(find $pkgname/include/os/ -type f -printf "%f\n"); do
    install -D -m 644 $pkgname/include/os/$file "$pkgdir/usr/bin/$pkgname/include/os/$file";
  done

  msg2 "Setting required environment variables..."
  
  local target="$HOME/.zshrc"
  if [[ $SHELL =~ "bash" ]]; then
    target="$HOME/.bashrc" 
  fi

  echo '' >> $target
  echo '# High-Level Assembler' >> $target
  echo 'export PATH=$PATH:/usr/bin/hla' >> $target
  echo 'export hlalib=/usr/bin/hla/hlalib' >> $target 
  echo 'export hlainc=/usr/bin/hla/include' >> $target

  source $target
}
