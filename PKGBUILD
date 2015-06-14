# Maintainer: Piotr Rogoża <piotr.r.public at gmail dot com>
# Contributor: Piotr Rogoża <piotr.r.public at gmail dot com>

pkgbase=gimp-elsamuko-plugins
# AUR workaround
pkgname=gimp-elsamuko-plugins
true && pkgname=(
  gimp-elsamuko-plugins
  gimp-plugin-depthmap
  gimp-plugin-copy-move
  gimp-plugin-octave
  gimp-plugin-temperature
  gimp-plugin-eaw-sharpen
  gimp-plugin-facedetect
  gimp-plugin-get-curves
  gimp-plugin-heatmap
  gimp-plugin-hsv-analysis
  gimp-plugin-lab-analysis
)
pkgver=0.1
pkgrel=4
arch=(i686 x86_64)
url='https://sites.google.com/site/elsamuko/gimp'
pkgdesc='Varoius Gimp plugins made by elsamuko'
license=('GPL')
depends=(gimp)
makedepends=(
gimp
opencv
unzip
cimg
)
source=(
https://sites.google.com/site/elsamuko/gimp/depthmap/elsamuko-depthmap-cv.tar.gz
depthmap-cv.patch
https://sites.google.com/site/elsamuko/forensics/clone-detection/elsamuko-copy-move.c
https://sites.google.com/site/elsamuko/gimp/gimp-octave/elsamuko-gimp-octave.c
https://sites.google.com/site/elsamuko/gimp/gimp-octave/filter_pack.tar.gz
https://sites.google.com/site/elsamuko/gimp/temperature/elsamuko-temperature.c
https://sites.google.com/site/elsamuko/gimp/eaw-sharpen/elsamuko-eaw-sharpen.tar.gz
eaw-sharpen.patch
https://sites.google.com/site/elsamuko/gimp/facedetect/elsamuko-facedetect-cv.tar.gz
face-detect-cv.patch
https://sites.google.com/site/elsamuko/gimp/get-curves/elsamuko-get-curves.c
https://sites.google.com/site/elsamuko/gimp/get-curves/AlienSkin-examples.zip
https://sites.google.com/site/elsamuko/gimp/get-curves/elsamuko-kodachrome
https://sites.google.com/site/elsamuko/gimp/heatmap/elsamuko-heatmap.c
https://sites.google.com/site/elsamuko/forensics/hsv-analysis/elsamuko-hsv-analysis.c
https://sites.google.com/site/elsamuko/forensics/lab-analysis/elsamuko-lab-analysis.tar.gz
cimg.patch
)
sha256sums=('37081258b6401bcc095d86b3a313b8fc4691f2f70b75e60d6f96be26ab1eb963'
            '70c9ef3ab10a5fdbf389266e2bcd30047191ac520740b196da93caefa4621be8'
            '2cfa1516ab49d1f8d94168c694219be940c2154f4128e3b3e77a8a24e8940312'
            '890e94b870278f49c1291eeb56efdcb6bffdfd8a5e6cba210dc7b47947f5bf2a'
            '20c8ec08587d61d87e91989a9655d693904eb56f402c1eb574c5e4c3a13d4ad1'
            'e548334b3aebc039a2ac92d1f24d0323ced5163acdfa47399e727a7853f469ed'
            '382f1c7f5fbdb653fcaccb95c84416ba68163c7fba74edff0e62c885005620a5'
            'de9312250d598cc4f599958edb45f2219779bb17cf2f834215cc53ee4d72f770'
            'f06daefe35132d87734b3854a58fa0847b7b313b86ae9f076883b651a0592d16'
            'd1fed09664684d4436902d261d4202b71b8f54ab58bcbdcde000ed51d8e65859'
            '58a136880bc4c83b768663caf28bd9aedfc3dca2bfb845d44d3f099926e98a80'
            '14cca94597b688aa6f2d4fff2bf807a3f9a0e7163dff897129dc685148029f6f'
            'c8ccb4ee657e24d89ff9e3bb279cc6f552d8d4e3e3e8d76a107c763eafd58d91'
            'f3514a0a99c2e9ebe318402f8bf1800cd11845f286763bbc5b33de38b22141d4'
            '6437349ceba4a7923bb66eae5d69f0a8077137fa340d4460d71295dbaa1bdbec'
            '2aa644462f919e77f8dd370dd3ed7a72f1c875f4227e99f520c89dd9a9186884'
            '2cbc494ac75df79f9c783fdbf5faf5ce69548a3c711b023e300cddb7047264bf')
noextract=(AlienSkin-examples.zip)
# env
_pluginsdir_eval='_pluginsdir="$pkgdir"/usr/lib/gimp/2.0/plug-ins'
_curvesdir_eval='_curvesdir="$pkgdir"/usr/share/$pkgname/examples/curves'
prepare() {
  cd "$srcdir"
  patch -Np1 -i "$srcdir"/eaw-sharpen.patch
  patch -Np1 -i "$srcdir"/depthmap-cv.patch
  patch -Np1 -i "$srcdir"/face-detect-cv.patch
  cd $srcdir/elsamuko-lab-analysis
  patch -Np1 -i $srcdir/cimg.patch
}
build() {
  cd "$srcdir"

  # octave, get-curves, hsv-analysis
  msg2 "Building octave plugin"
  gimptool --build elsamuko-gimp-octave.c
  msg2 "Building get-curves plugin"
  gimptool --build elsamuko-get-curves.c
  msg2 "Building hsv-analysis plugin"
  gimptool --build elsamuko-hsv-analysis.c
  # heatmap
  msg2 "Building heatmap plugin"
  CC='gcc -lm' gimptool --build elsamuko-heatmap.c
  # copy-move
  msg2 "Building copy-move plugin"
  CC=g++ CFLAGS=-O3 LIBS=-lpthread gimptool --build elsamuko-copy-move.c
  # temperature
  msg2 "Building temperature plugin"
  CC="g++ -O3" gimptool --build elsamuko-temperature.c
  # eaw-sharpen
  msg2 "Building eaw-sharpen plugin"
  cd "$srcdir"/elsamuko-eaw-sharpen
  make
  # depthmap-cv
  msg2 "Building depthmap-cv plugin"
  gimptool --build elsamuko-depthmap.c
  cd "$srcdir"/elsamuko-depthmap-cv
  make
  # face-detect-cv
  msg2 "Building face-detect-cv plugin"
  cd "$srcdir"/elsamuko-facedetect-cv
  make
  # lab-analysis
  msg2 "Building lab-analysis plugin"
  cd "$srcdir"/elsamuko-lab-analysis
  CC='g++ -lX11' CFLAGS=-O3 gimptool --build elsamuko-lab-analysis.c
}
package_gimp-elsamuko-plugins(){
  true && pkgdesc='Varoius Gimp plugins made by elsamuko, transition package to split build'
}
package_gimp-plugin-depthmap (){
  true && pkgdesc="Generates a depthmap out of two stereoscopic images."
  true && url='https://sites.google.com/site/elsamuko/gimp/depthmap'
  true && depends=(gimp-elsamuko-plugins opencv)
  eval $_pluginsdir_eval
  cd "$srcdir"/elsamuko-depthmap-cv
  install -dm755 "${_pluginsdir}"
  install -Dm755 elsamuko-depthmap-cv "$_pluginsdir"/
}
package_gimp-plugin-copy-move (){
  true && pkgdesc="Detects image manipulations which have been created with the clone tool"
  true && url='https://sites.google.com/site/elsamuko/forensics/clone-detection'
  true && depends=(gimp-elsamuko-plugins)
  eval $_pluginsdir_eval
  cd "$srcdir"
  install -dm755 "${_pluginsdir}"
  install -Dm755 elsamuko-copy-move "$_pluginsdir"/
}
package_gimp-plugin-octave (){
  true && pkgdesc="Provides a simple interface between GIMP and GNU Octave"
  true && url='https://sites.google.com/site/elsamuko/gimp/gimp-octave'
  true && optdepends=('octave-image: run Octave script in the Gimp')
  true && depends=(gimp-elsamuko-plugins)
  install='gimp-plugin-octave.install'
  eval $_pluginsdir_eval
  cd "$srcdir"
  install -dm755 "${_pluginsdir}"
  install -Dm755 elsamuko-gimp-octave "$_pluginsdir"/
  # examples .m files
  install -dm755 "$pkgdir"/usr/share/$pkgname/examples
  cp -r filter_pack "$pkgdir"/usr/share/$pkgname/examples
  # doc files
  install -dm755 "$pkgdir"/usr/share/doc/$pkgname
  mv "$pkgdir"/usr/share/$pkgname/examples/filter_pack/README \
    "$pkgdir"/usr/share/doc/$pkgname/octave-plugin.README

}
package_gimp-plugin-temperature (){
  true && pkgdesc="Changes the color temperature of an image via shifting it in the YUV color space"
  true && url='https://sites.google.com/site/elsamuko/gimp/temperature'
  true && depends=(gimp-elsamuko-plugins)
  eval $_pluginsdir_eval
  cd "$srcdir"
  install -dm755 "${_pluginsdir}"
  install -Dm755 elsamuko-temperature "$_pluginsdir"/
}
package_gimp-plugin-eaw-sharpen (){
  true && pkgdesc="A filter which sharpens an image without annoying halos"
  true && url='https://sites.google.com/site/elsamuko/gimp/eaw-sharpen'
  true && depends=(gimp-elsamuko-plugins)
  eval $_pluginsdir_eval
  cd "$srcdir"/elsamuko-eaw-sharpen
  install -dm755 "${_pluginsdir}"
  install -Dm755 elsamuko-eaw-sharpen "$_pluginsdir"/
}
package_gimp-plugin-facedetect (){
  true && pkgdesc="Detects faces in an input image"
  true && url='https://sites.google.com/site/elsamuko/gimp/facedetect'
  true && depends=(gimp-elsamuko-plugins opencv)
  eval $_pluginsdir_eval
  cd "$srcdir"/elsamuko-facedetect-cv
  install -dm755 "${_pluginsdir}"
  install -Dm755 elsamuko-facedetect-cv "$_pluginsdir"/
  install -Dm644 haarcascade_frontalface_alt.xml "$_pluginsdir"/
}
package_gimp-plugin-get-curves (){
  true && pkgdesc="Calculates the color curve from two different pictures"
  true && url='https://sites.google.com/site/elsamuko/gimp/get-curves'
  true && depends=(gimp-elsamuko-plugins)
  install='gimp-plugin-get-curves.install'
  _pluginsdir="$pkgdir"/usr/lib/gimp/2.0/plug-ins
  eval $_pluginsdir_eval $_curvesdir_eval
  cd "$srcdir"
  install -dm755 "$_curvesdir"
  unzip -q AlienSkin-examples.zip -d ${_curvesdir}

  install -dm755 "${_pluginsdir}"
  install -Dm755 elsamuko-get-curves "$_pluginsdir"/
  # GIMP curves tool settings
  install -Dm644 "$srcdir"/elsamuko-kodachrome "$_curvesdir"/
  chmod 0644 "$_curvesdir"/*
}
package_gimp-plugin-heatmap (){
  true && pkgdesc="Calculates a heatmap from a picture"
  true && url='https://sites.google.com/site/elsamuko/gimp/heatmap'
  true && depends=(gimp-elsamuko-plugins)
  eval $_pluginsdir_eval
  cd "$srcdir"
  install -dm755 "${_pluginsdir}"
  install -Dm755 elsamuko-heatmap "$_pluginsdir"/
}
package_gimp-plugin-hsv-analysis (){
  true && pkgdesc="HSV analysis"
  true && url='https://sites.google.com/site/elsamuko/forensics/hsv-analysis'
  true && depends=(gimp-elsamuko-plugins)
  eval $_pluginsdir_eval
  cd "$srcdir"
  install -dm755 "${_pluginsdir}"
  install -Dm755 elsamuko-hsv-analysis "$_pluginsdir"/
}
package_gimp-plugin-lab-analysis (){
  true && pkgdesc="LAB analysis"
  true && url='https://sites.google.com/site/elsamuko/forensics/lab-analysis'
  true && depends=(gimp-elsamuko-plugins)
  eval $_pluginsdir_eval
  cd "$srcdir"/elsamuko-lab-analysis
  install -dm755 "${_pluginsdir}"
  install -Dm755 elsamuko-lab-analysis "$_pluginsdir"/
}
