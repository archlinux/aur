# Maintainer : chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Contributor:  Leandro Britez <britinx (at) hotmail.com>
# Contributor: Daniel YC Lin <dlin.tw (at) gmail.com>
#81aad9a50e380814107af0baaf5e05949f12b0cc
pkgname=grub4dos
pkgver="0.4.5c_20140822"
pkgrel=2
_rel=81aad9a50e380814107af0baaf5e05949f12b0cc
pkgdesc="A GRUB boot loader support menu on windows(fat,ntfs)/linux(ext2,3,4)"
arch=(i686 x86_64)
url="http://grub4dos.chenall.net/"
license=('GPL2')
backup=(grub/menu.lst)
makedepends=('upx' 'nasm')
[ "$CARCH" = x86_64 ] && makedepends=('upx' 'nasm' 'gcc-multilib')
install=grub4dos.install
conflicts=(grub4dos)
options=('!strip' '!buildflags' '!makeflags')

md5sums=('4e97c87e13fbe0ec08585edcd84814b0'
         'd84dde7476cb6ef37df3b159a1c3f1e8'
         '32cc5705f5328dc30077e9d0a96ded3b')

source=(
  "https://github.com/chenall/grub4dos/archive/$_rel.zip"
  README_arch.txt
  menu.lst
)

prepare() {
  cd "$pkgname-$_rel"
  # Patch: Only allow a single thread
  sed -i -e 's:make |:make -j1 |:' build
}

build() {
  cd "$pkgname-$_rel"
  #GRUB4DOS_TEMP=$PWD/tmp ./build
  unset CFLAGS
  unset CFLAGS
  unset CXXFLAGS
  unset LDFLGAS
  unset CPPFLAGS
  temp_flags=(`grep -E '^CFLAGS=.+' /etc/makepkg.conf | cut -d '"' -f 2`)
  for i in ${temp_flags[@]};do [ "$i" != "-fstack-protector" ] && CFLAGS+="$i ";done
  CXXFLAGS=("`grep -E '^CXXFLAGS=.+' /etc/makepkg.conf | cut -d '"' -f 2`")
  LDFLAGS=("`grep -E '^LDFLAGS=.+' /etc/makepkg.conf | cut -d '"' -f 2`")
  CPPFLAGS=("`grep -E '^CPPFLAGS=.+' /etc/makepkg.conf | cut -d '"' -f 2`")
  ./configure --enable-preset-menu=preset_menu.lst
  make -j1
  cd stage2
  # Generate bootlace64.com:
  size=`ls -l bootlace.com|awk '{print $5}'`
  dd if=bootlace.com of=bootlace.head bs=1 count=64
  dd if=bootlace.com of=bootlace.body bs=1 count=`expr $size - 128` skip=64
  dd if=bootlace.com of=bootlace.tail bs=1 count=64 skip=`expr $size - 64`
  cat bootlace.tail bootlace.body bootlace.head > bootlace64.com
  chmod a+x bootlace64.com
  rm -f bootlace.tail bootlace.body bootlace.head
}

package() {
  cd $srcdir
  for _f in menu.lst ; do
    install -Dm 644 "$_f" "$pkgdir/grub/$_f"
  done

  _f=README_arch.txt ; install -Dm 644 "$_f" "$pkgdir/usr/share/doc/grub4dos/$_f"

  cd $srcdir/$pkgname-$_rel
  _f=default ; install -Dm 644 "$_f" "$pkgdir/grub/$_f"
  for _f in grub.exe grldr ; do
    install -Dm 644 "stage2/$_f" "$pkgdir/grub/$_f"
  done
  _f=bootlace.com ; install -Dm 755 "stage2/$_f" "$pkgdir/usr/bin/$_f"
  if [ `uname -m` = x86_64 ] ; then
    _f=bootlace64.com ; install -Dm 755 stage2/$_f "$pkgdir/usr/bin/$_f"
  fi

  for _f in README_GRUB4DOS.txt ChangeLog_GRUB4DOS.txt README_GRUB4DOS_CN.txt \
    ChangeLog_chenall.txt ; do

    install -Dm 644 $_f "$pkgdir/usr/share/doc/grub4dos/$_f"
  done
}
