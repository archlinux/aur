# Maintainer: Que Quotion ( quequotion at g mail dot com )

pkgname=makepkg-optimize
pkgver=1
pkgrel=6
pkgdesc='Additional package optimization routines for makepkg'
arch=('i686' 'x86_64')
license=('GPL')
url='https://projects.archlinux.org/pacman.git/'
depends=('pacman' 'upx' 'optipng' 'nodejs-svgo')
backup=(etc/makepkg-optimize.conf)
source=({00.optipng,01.upx,02.lto,03.pgo,04.graphite,05.svgo}.patch
        {upx,optipng,svgo}.sh.in
        {buildenv,destdirs,pkgopts{,-param}}_ext.conf
        'opticonf.patch' 'compress-param_max.conf')
sha512sums=('67fb9359cd5dc52413ad2ca7e91b445826d7cf6b7ad3db0d2b3845310ab0bdfc41c2e70cec564e26269521ac313f7202c44996a24266380e48e88927bd1012e2'
            'b4896082fd7fc4a69abc5fc98bf22c92a94cef9ccae5d3e5d1825cd3f04dcff1bce622a3f7fdc00bd43b5e1d091825d119b3a91d354f1ab58e6a8fe3af72b0e2'
            'bbd4bf3ddbda97008764c1a619aee4f2e3d3476c8affaac75ffee328db452f587454f16158942ec666e2357474a052019e5641ce6d432c43593b3612bdc40af2'
            '5a8083ea14a6a414051602740d1cabf80e77119570b8555194bd921c46a4fce5a7e6611d04a778bfe688e30b0de5ccd6c458299d279476e4ffcc01577959d949'
            '3520817c16ea83a4bed28f153138608456267eac0caed250f8d951c54cf6a07d07e5b13768c5165a8e31a56e76919b3c9b84ad3b2905489ce65e625fa067f9b0'
            'c2f74ab15214ccac6ae570fa4a4ebfdf35690be60851be9eb8ab65c1ce4ebed0f0d3cb98947fd4a586d19cb399d312390ebbc68f4de86f607adef2a2d590798e'
            '0cbcc6590b901ac33dc78b755300da02070c5abb68153a55eb7b1bf5426dd37286f5831185c53eff189fc689796a234bad84fddc8e8f43edf6b19f13667291c7'
            'c2b109f3f167f61fb0cbe3580a190189f0aac9b5886cf9aba447e2e074179cd1a506d54cbc0ae4df59ff3e3d537e8d3176786a805cfcba7f90525d135824fd6b'
            '917fd21b7dcb7ccb1d82bae4e31e65fd7610c4ca0b01db2ee1a379828240c59a6eeae176e1221b04421ace5ad89a871669def4730120741173e48b05c117aadb'
            '61672f1db64ca633dd3139ee1d5d9a2009f94f6b0de0bdf9466a51bbe397f1f410fda717b8ff775e85e1ec7dc9f2313653af2ddbbf1835c66475cdeed7f67218'
            'e3b61fa175c7c086b5e40413e280afa59efae64f6a29ec03f395b48d6a4ee7086603c9a8295a36cb0d091ef28bf3444d02e78b288db2225d29336aac23eda317'
            'abe0b14869417dfe978beeb57b9527bc3c3651ddd5a88e9a5293438e3d1ebcde41a58f60bc0d0e68b6d8b4ede228904b520a3e10ac26c8572110a312a38e15b6'
            '16ad444485cdee165f00a2e1a24ff9f74fad43c8da959feaa196be1719e67e3153daac6661b116e2351a55091504056cb7bc785943092f9f9fdaa46bd5f0d3d9'
            '16c2b0e666234f1a493e7456f4c387fbabd24b10514c93fa4338520e8f537e9a12de0d833a6148fe871452d87f6e1b3454b2bde332b9ba4c4e7680616b7eeede'
            'bbc69d237a4be0b91d3e8197d40ddb3a587c4f4c4a1fb233d3249689543ad66d56b3aef02d886f6f7d9e5a52c64a45f2d44772156bb01a50ac8e769fdc30dbe7')

prepare() {
  # Use the user's currently installed versions as a base
  cp /usr/bin/makepkg ./makepkg-optimize
  cp /etc/makepkg.conf ./makepkg-optimize.conf

  # How to check for the unlikely possiblity that the directory was changed?
  sed -i "s|@libmakepkgdir@|/usr/share/makepkg|g"  *.sh.in

  #Comment on additional BUIDENV options
  sed -i "/#-- sign/r buildenv_ext.conf" makepkg-optimize.conf

  #Comment on additional ~~DEST directories
  sed -i "/SRCPKGDEST=/r destdirs_ext.conf" makepkg-optimize.conf

  #Comment on additional OPTIONS options
  sed -i "/#-- debug/r pkgopts_ext.conf" makepkg-optimize.conf

  #Comment on additional OPTIONS options parameters
  sed -i "/PURGE_TARGETS=/r pkgopts-param_ext.conf" makepkg-optimize.conf

  #Comment on maximum COMPRESS~~ parameters
  sed -i "/COMPRESSZ=/r compress-param_max.conf" makepkg-optimize.conf

  # Add features in series
  patch -Np0 < ../opticonf.patch
  patch -Np0 < ../00.optipng.patch
  patch -Np0 < ../01.upx.patch
  patch -Np0 < ../02.lto.patch
  patch -Np0 < ../03.pgo.patch
  patch -Np0 < ../04.graphite.patch
  patch -Np0 < ../05.svgo.patch
}

package() {
  #makepkg-optimize
  cd $pkgname
  mkdir -p $pkgdir/usr/{bin,share/makepkg/tidy}/
  install -m755 makepkg-optimize $pkgdir/usr/bin/

  # Tidy scripts
  #Uncomment once dropped from pacman.
  #install -m755 ../optipng.sh.in $pkgdir/usr/share/makepkg/tidy/optipng.sh
  #install -m755 ../upx.sh.in $pkgdir/usr/share/makepkg/tidy/upx.sh
  install -m755 ../svgo.sh.in $pkgdir/usr/share/makepkg/tidy/svgo.sh

  # Separate config file
  mkdir -p $pkgdir/etc/
  install -m644 makepkg-optimize.conf $pkgdir/etc/
}
