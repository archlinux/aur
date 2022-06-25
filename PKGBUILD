# Maintainer: ptr1337 (ptr1337@cachyos.org)
# Contributor: Que Quotion ( quequotion@bugmenot.com )
# Contributor: bartus ( aur\at\bartus.33mail.com )

pkgname=makepkg-optimize-mold
pkgver=28
pkgrel=2
pkgdesc='Supplemental build and packaging optimizations for makepkg'
arch=('any')
license=('GPL')
url='https://wiki.archlinux.org/index.php/Makepkg-optimize'
depends=('pacman')
optdepends=("upx: Compress executables"
    "optipng: Optimize PNG files"
    "svgo: Optimize SVG files"
    "openmp: Parallelize loops"
    "polly: Polyhedral model optimization for clang"
    "mold: a modern fast linker"
    "lld: the clang linker"
    "aocc: use amd's llvm compiler for compiling"
    "aocl-aocc: use amd's compiler libary for compiling"
	"buildcache: a alternative to ccache")
backup=(etc/makepkg-optimize.conf)
_buildenv=({pgo,graphite,rice,mold,bolt,buildcache,lld,aocc,relocs,relocsgcc}.sh.in)
_executable=({upx,optipng,svgo}-exec.sh.in)
_tidy=({upx,optipng,svgo}.sh.in)
_conf=({{c,cxx,make,ld,cmake-}flags,{buildenv,destdirs,pkgopts{,-param}}_ext,compress-param_max}.conf)
source=(${_buildenv[@]}
    ${_executable[@]}
    ${_tidy[@]}
${_conf[@]})
sha1sums=('1acc26a5a5737804f5aa6cca9d4bbce733e0f429'
          '7556b8a8faff5b943efa5058ce9d8e325c4d35a6'
          'd4e8f5ec1c30ebd69cce5121ea7823e1b42c3d27'
          'eff21a001ae20ea6c06aba4c82e6a8e79711acb2'
          'f8387e71a8807296fc24824eb16a3e53c7bc9f8a'
          '2374539e56aeed165cc15e790e17fe841fa0970d'
          'ab510f1789a9bcd1352706f13f6a0bb662d25831'
          '28b5ce40ba54198e715d79d97adaa54b67c2c7e5'
          'e9bcb9d89b5a28bab77d0f20c9a19b5487acd89a'
          '0f2302c79ac2a05ea5628de0d8b36afbf43684b3'
          'e80ee78932db189f8336d55ed27323c4b07d2652'
          '7e9ce9e54959a173c01920644933425ebbe1727b'
          'e2fa9aab0925d57720fb527ad8b5aeab9da13981'
          '14492f053f54ef8bbcabe6bf289cade742562311'
          'c61e7226d5ea585447ba2bdb9c61f29f177999ce'
          'b6d54fd495d26a2c1578b77b678610393d4b1b45'
          '55170acd48805465d6b0c45b3a29eee2a2523de8'
          '4cd8012f8946761d7288a198af7edb3ebaf0ece0'
          'df4dea649b6ca775dbd4fa8590fa285517710429'
          'c64344daf52acf5efa20b1b74facea448b3edf21'
          '981eab856abb43c5e093620cdf4d8bfa2d690805'
          'ec44d7d20cb8f576dc263e29d5ea20e906e0a80f'
          'efb3ed7d7d5516259709149d7bcd6ec208c07593'
          '1fc8035e64b739e20c70fbb4eaa5cb7aa1c63c90'
          '5d0cde13b50641371e4ec4d813d6b2dfae493889'
          '8f54d9798899123aa28085ce74ae9dd34b84c075')

prepare() {
    # Use the current makepkg config as a base
    cp /etc/makepkg.conf ./makepkg-optimize.conf

    # How to check for the unlikely possiblity that the directory was changed?
    sed -i "s|@libmakepkgdir@|/usr/share/makepkg|g"  *.sh.in
    for file in *.sh.in; do mv $file ${file%.in}; done

    #Extra ricer and debugging CFLAGS
    sed -i "/^CFLAGS/r cflags.conf" makepkg-optimize.conf

    #Mirror CFLAGS into CXXFLAGS
    sed -i "/^CXXFLAGS/r cxxflags.conf" makepkg-optimize.conf

    #Extra ricer Makeflags
    sed -i "/^MAKEFLAGS/r makeflags.conf" makepkg-optimize.conf

    #Extra ricer LDFLAGS
    sed -i "/^LDFLAGS/r ldflags.conf" makepkg-optimize.conf

    #Debugging flags for make (note, DEBUG_MAKEFLAGS isn't a real thing)
    sed -i "/^DEBUG_CXXFLAGS/r debug-makeflags.conf" makepkg-optimize.conf

    #Cmake is a build obfuscation system
    sed -i "/^#DEBUG_MAKEFLAGS/r cmake-flags.conf" makepkg-optimize.conf

    #Additional BUIDENV macros
    sed -i "/^#-- sign/r buildenv_ext.conf" makepkg-optimize.conf

    #Additional DEST directories
    sed -i "/^#*SRCPKGDEST=/r destdirs_ext.conf" makepkg-optimize.conf

    #Additional OPTIONS macros
    sed -i "/^#-- debug/r pkgopts_ext.conf" makepkg-optimize.conf

    #Additional OPTIONS parameters
    sed -i "/^#*PURGE_TARGETS=/r pkgopts-param_ext.conf" makepkg-optimize.conf

    #Maximum COMPRESS parameters
    sed -i "/^COMPRESSLZ=/r compress-param_max.conf" makepkg-optimize.conf
}

package() {
    # BUILDENV extension scripts
    install -m644 -D -t ${pkgdir}/usr/share/makepkg/buildenv/ ${_buildenv[@]%.in}

    # Executable finding scripts
    for i in ${_executable[@]%.in}; do
    install -m644 -D -T ${i} ${pkgdir}/usr/share/makepkg/executable/${i//-exec.sh/.sh}; done

    # Supplemental Tidy scripts
    install -m644 -D -t ${pkgdir}/usr/share/makepkg/tidy/ ${_tidy[@]%.in}

    # Separate config file
    install -m644 -D -t ${pkgdir}/etc/ makepkg-optimize.conf
}
