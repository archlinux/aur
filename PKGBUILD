# Maintainer: firef <use_my_id at gmail dot com>
 
pkgname=yong
pkgver=2.5.0
pkgrel=1
pkgdesc="Tiny Small Chinese Input Method"
arch=('x86_64')
url="https://github.com/dgod/yong"
license=('GPL')
 
makedepends=('git' 'nodejs' 'gcc' 'wayland' 'gtk2' 'gtk3' 'qt5-base')
#provides=("yong=$pkgver")
 
depends=('gtk3')
 
#install=yong.install
 
source=("git+https://hub.fastgit.org/dgod/yong.git" "git+https://hub.fastgit.org/dgod/build.js.git")
md5sums=('SKIP' 'SKIP')
 
 
pkgver() {
    cd "$srcdir/$pkgname/install"
    awk '/%define +version/{print $3}' yong.spec | sed 's|-|.|g'
}
prepare(){
    cd  $srcdir/$pkgname
    mkdir -p {llib,cloud,gbk,mb,vim}/l64
    mkdir -p {im,config}/{l64-gtk3,l64-gtk2}
    mkdir -p im/gtk-im/{l64-gtk3,l64-gtk2}
    mkdir -p im/IMdkit/l64
    mkdir -p im/qt5-im/l64-qt5
 
 
sed -i 's/copy_build("l32");//' install/build.txt
sed -i 's_MOC=.*_MOC="/usr/bin/moc"_' im/qt5-im/build.txt
# modify shuangping rules
sed -i -r  -e "s/'p'(,[1|2],\"\wh{0,1}un\")/'y'\1/g" \
-e "s/'d'(,[1|2],\"\wh{0,1}uang\")/'l'\1/g" \
-e "s/'d'(,[1|2],\"\wh{0,1}iang\")/'l'\1/g" \
-e "s/'y'(,[1|2],\"\wh{0,1}uai\")/'k'\1/g"  \
-e "s/'y'(,[1|2],\"\wh{0,1}ing\")/'k'\1/g" \
-e "s/'w'(,[1|2],\"\wh{0,1}ua\")/'x'\1/g"  \
-e "s/'w'(,[1|2],\"\wh{0,1}ia\")/'x'\1/g"  \
-e "s/'b'(,[1|2],\"\wh{0,1}ou\")/'z'\1/g"  \
-e "s/'z'(,[1|2],\"\wh{0,1}ei\")/'w'\1/g"  \
-e "s/'k'(,[1|2],\"\wh{0,1}ao\")/'c'\1/g"  \
-e "s/'l'(,[1|2],\"\wh{0,1}ai\")/'d'\1/g"  \
-e "s/'n'(,[1|2],\"\wh{0,1}in\")/'b'\1/g"  \
-e "s/'x'(,[1|2],\"\wh{0,1}ie\")/'p'\1/g"  \
-e "s/'c'(,[1|2],\"\wh{0,1}iao\")/'n'\1/g"  common/pinyin.c
cp -f common/pinyin.c cloud/pinyin.c

sed -i 's/"自然码"/"小鹤双拼"/' config/config_ui.c
}
build() {
 
buildjs="$srcdir/build.js/build.js"
 cd $srcdir/$pkgname
    node $buildjs  l64 
   node $buildjs -C install  copy
}
 
package() {
   mkdir -p $pkgdir/usr/bin
   mkdir -p $pkgdir/usr/share
  cp -a $srcdir/$pkgname/install/yong $pkgdir/usr/share
   cd $pkgdir/usr/share/yong
   ln -sf ../share/yong/l64/yong-gtk3 $pkgdir/usr/bin/yong
   ln -sf ../share/yong/l64/yong-config-gtk3 $pkgdir/usr/bin/yong-config
   install -D $srcdir/$pkgname/im/qt5-im/l64-qt5/libyongplatforminputcontextplugin.so $pkgdir/usr/lib/qt/plugins/platforminputcontexts/libyongplatforminputcontextplugin.so
   install -D locale/zh_CN.mo $pkgdir/usr/share/locale/zh_CN/LC_MESSAGES/yong.mo
   install -D l64/gtk-im/im-yong-gtk2.so $pkgdir/usr/lib/gtk-2.0/2.10.0/immodules/im-yong.so
   install -D l64/gtk-im/im-yong-gtk3.so $pkgdir/usr/lib/gtk-3.0/3.0.0/immodules/im-yong.so
   
	   # modify config file
	sed -i -e 's/default=0/default=4/' \
		   -e "s/select=LSHIFT RSHIFT/select=; '/" \
		   -e "s/CNen=LCTRL/CNen=LSHIFT/"   \
		   -e "s/page=- =/page=, ./"   \
		   -e "/keypad=0/a\ABCD=1"   \
	./yong.ini

cat << EOF >> ./yong.ini
[hepy]
name=双拼
engine=libmb.so
arg=mb/pinyin.txt
overlay=mb/sp.ini
sp=zrm
EOF
	sed -i -e 's/4=gbk/4=pinyin/' \
		   -e 's/5=pinyin/5=hepy/' \
	./yong.ini

	# modify end

	# change default skin
	png="iVBORw0KGgoAAAANSUhEUgAAAB4AAAATCAIAAAAIzCorAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sFCwYzDrySergAAAAhSURBVDjLY/z8+TMDbQATA83AqNGjRo8aPWr0qNEj3mgAvhgC/8aR0LcAAAAASUVORK5CYII="
	echo $png | base64 -d  > ./skin/name1.png
	for name in skin skin0 skin1 skin2; do
	  sed -i -e 's/s2t=84,3/name=90,6/' \
			 -e 's/s2t_s=jian1.png/name_img=name1.png/' \
			 -e 's/s2t_t=fan1.png/name_font=Bold 18/' \
			 -e 's/keyboard=108,3/name_color=#3975ce/' \
			 -e '/keyboard_img/d' ./skin/${name}.ini
	done
	# modify end
     
}
post_install() {
  gtk-query-immodules-2.0 --update-cache 
  gtk-query-immodules-3.0 --update-cache 
}
 
post_remove() {
  gtk-query-immodules-2.0 --update-cache 
  gtk-query-immodules-3.0 --update-cache 
}
