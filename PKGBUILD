# Maintainer: Que Quotion ( quequotion@bugmenot.com )
# Contributor: bartus ( aur\at\bartus.33mail.com )

pkgname=makepkg-optimize
pkgver=2
pkgrel=1
pkgdesc='Supplemental build and packaging optimizations for makepkg'
arch=('any')
license=('GPL')
url='https://bbs.archlinux.org/viewtopic.php?id=210350'
conflicts=(makepkg-optimize{,2})
replaces=('makepkg-optimize2')
depends=('pacman-buildenv_ext-git')
optdepends=('upx' 'optipng' 'nodejs-svgo' 'graphite')
backup=(etc/makepkg-optimize.conf)
_buildenv_ext=({pgo,lto,graphite}.sh.in)
_tidy=({upx,optipng,svgo}.sh.in)
_conf=({buildenv,destdirs,pkgopts{,-param}}_ext.conf 'compress-param_max.conf')
source=(${_buildenv_ext[@]}
        ${_tidy[@]}
        ${_conf[@]}
        )
sha512sums=('cc885a45311f60f3512d562ca6502ec7a38440383bae4df82c6cb34f5fe4ff8f7fe9c627bea0aadd32c34ea531ab4acc50a04271d1dc0b807a3e3f34b3f29289'
            '566681dfc0a84f6b3f654250bb0967bfe13563ad6dcae13d9cc6e30b359f34544c5f473e3b23973e0406e405c7047d866d6459bf999c0579ff43b36d1615bfe0'
            '4cda8968bf9e2a1cd7f20987183b91be8becec190c7a56a5d47fecb1da373077190af0c7be627338160c371d4b3c68cb12b76783e9118de29df30a285f9e5bd9'
            '0cbcc6590b901ac33dc78b755300da02070c5abb68153a55eb7b1bf5426dd37286f5831185c53eff189fc689796a234bad84fddc8e8f43edf6b19f13667291c7'
            'c2b109f3f167f61fb0cbe3580a190189f0aac9b5886cf9aba447e2e074179cd1a506d54cbc0ae4df59ff3e3d537e8d3176786a805cfcba7f90525d135824fd6b'
            '917fd21b7dcb7ccb1d82bae4e31e65fd7610c4ca0b01db2ee1a379828240c59a6eeae176e1221b04421ace5ad89a871669def4730120741173e48b05c117aadb'
            '61672f1db64ca633dd3139ee1d5d9a2009f94f6b0de0bdf9466a51bbe397f1f410fda717b8ff775e85e1ec7dc9f2313653af2ddbbf1835c66475cdeed7f67218'
            'e3b61fa175c7c086b5e40413e280afa59efae64f6a29ec03f395b48d6a4ee7086603c9a8295a36cb0d091ef28bf3444d02e78b288db2225d29336aac23eda317'
            'abe0b14869417dfe978beeb57b9527bc3c3651ddd5a88e9a5293438e3d1ebcde41a58f60bc0d0e68b6d8b4ede228904b520a3e10ac26c8572110a312a38e15b6'
            '16ad444485cdee165f00a2e1a24ff9f74fad43c8da959feaa196be1719e67e3153daac6661b116e2351a55091504056cb7bc785943092f9f9fdaa46bd5f0d3d9'
            'bbc69d237a4be0b91d3e8197d40ddb3a587c4f4c4a1fb233d3249689543ad66d56b3aef02d886f6f7d9e5a52c64a45f2d44772156bb01a50ac8e769fdc30dbe7')

prepare() {
  # Use the current makepkg config as a base
  cp /etc/makepkg.conf ./makepkg-optimize.conf

  # How to check for the unlikely possiblity that the directory was changed?
  sed -i "s|@libmakepkgdir@|/usr/share/makepkg|g"  *.sh.in
  for file in *.sh.in; do mv $file ${file%.in}; done

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
}

package() {
  # BUILDENV extension scripts
  install -m755 -D -t ${pkgdir}/usr/share/makepkg/buildenv_ext/ ${_buildenv_ext[@]%.in}

  # Supplemental Tidy scripts
  install -m755 -D -t ${pkgdir}/usr/share/makepkg/tidy/ ${_tidy[@]%.in}

  # Separate config file
  install -m644 -D -t ${pkgdir}/etc/ makepkg-optimize.conf
}
