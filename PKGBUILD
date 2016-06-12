# Contributer: Gadget3000 <gadget3000 at msn dot com>
# Contributer: N30N <archlinux@alunamation.com>
# Maintainer: debdj <debd92@gmail.com>

pkgname=yofrankie
pkgver=1.1
pkgrel=4
pkgdesc="A 3D platform game based on the bully rodent in Big Buck Bunny"
url="http://www.yofrankie.org/"
license=("CCPL")
arch=('any')
depends=('libjpeg6=6b1-2' 'python2')
conflicts=("yofrankie-demo-glsl")
source=("yofrankie.desktop" \
	"yofrankie.sh"
	"yofrankie.png" \
	"http://download.blender.org/apricot/yofrankie_${pkgver/./_}b_bge.zip")
md5sums=('d95468f23f1b41bc33ced8cd58c908de'
         'db35b001da266610609ae20fae5ee71e'
         '0c80203d56bd4bbbc5f1e74c8e32a54a'
         '863924c515b483adfa5f63e8d982b5c2')

#build() {
#	cd ${srcdir}/yofrankie_${pkgver/./_}b_bge
#	sed -i 's_python_python2_' Makefile
#	make
#}

package() {
	install -D -m644 ${startdir}/yofrankie.desktop ${pkgdir}/usr/share/applications/yofrankie.desktop
	install -D -m644 ${startdir}/yofrankie.png ${pkgdir}/usr/share/pixmaps/yofrankie.png
	install -Dm755 ${startdir}/yofrankie.sh ${pkgdir}/usr/bin/yofrankie.sh
	# or if you want the ugly icon...
	# install -D -m644 yofrankie_${pkgver/./_}b_bge/dist/yofrankie.png ${pkgdir}/usr/share/pixmaps/yofrankie.png

	data=(
		"audio"
		"levels"
		"levels/level_scripts"
		"levels/menu_scripts"
		"levels/selector_scripts"
		"chars"
		"chars/frankie_scripts"
		"chars/sheep_scripts"
		"chars/textures"
		"menus"
		"effects"
		"effects/effects_scripts"
		"props"
		"hud"
		"hud/hud_scripts"
		"textures"
		"textures/credits"
		"textures/level_lighthouse"
		"textures/level_nut"
		"textures/level_nut/raw"
	     )

	

	cd ${srcdir}/yofrankie_${pkgver/./_}b_bge

	#install the binaries
	[[ `uname -m` = 'x86_64' ]] && install -Dm 755 yofrankie-linux-x86_64.bin ${pkgdir}/usr/bin/yofrankie/yofrankie-linux-x86_64.bin
	[[ `uname -m` = 'i386' ]] && install -Dm 755 yofrankie-linux-i386.bin ${pkgdir}/usr/bin/yofrankie/yofrankie-linux-i386.bin

	#ln -s -T ${pkgdir}/usr/bin/yofrankie/yofrankie-linux-*.bin ${pkgdir}/usr/bin/yofranky

	#data files
	install -Dm644 yo_frankie_stub.blend ${pkgdir}/usr/share/yofrankie/yo_frankie_stub.blend
	#ln -s -t ${pkgdir}/usr/bin/yofrankie/ ${pkgdir}/usr/share/yofrankie/yo_frankie_stub.blend

	#if [[ `uname -m` = 'x86_64' ]]; then
	#install -Dm644 yofrankie-linux-x86_64.bin.bgeconf \
#${pkgdir}/usr/share/yofrankie/yofrankie-linux-x86_64.bin.bgeconf
	#ln -s -t ${pkgdir}/usr/bin/yofrankie/ ${pkgdir}/usr/share/yofrankie/yofrankie-linux-x86_64.bin.bgeconf
	#fi

	for ((i=0; i< ${#data[@]}; i++)); do
	mkdir -p ${pkgdir}/usr/share/yofrankie/${data[i]}
	install -m644 -t ${pkgdir}/usr/share/yofrankie/${data[i]} ${data[i]}/*.*
	mkdir -p ${pkgdir}/usr/bin/yofrankie/${data[i]}
	for item in ${pkgdir}/usr/share/yofrankie/${data[i]}/*; do
	ln -s -t ${pkgdir}/usr/bin/yofrankie/${data[i]} ${item}
	done
	done

	#make the python scripts executable
	for i in ${pkgdir}/usr/share/yofrankie/*/*_scripts/*; do
	chmod 755 ${i}
	done
}
