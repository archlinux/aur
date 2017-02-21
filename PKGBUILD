pkgbase=higan-qq
pkgname=('higan-qq' 'libananke')
pkgver=094.8d4b3cfa
pkgrel=2
pkgdesc="A Nintendo multi-system emulator with quequotion's customizations"
arch=('i686' 'x86_64')
url=http://byuu.org/higan/
license=(GPL)
replaces=('higan-qq-git')
source=('higan::git+https://github.com/quequotion/higan-qq.git'
	'profilebatch'
        'super-fx-hax.patch'
        'mercury.patch')
install=higan.install
md5sums=('SKIP'
         '42cf726affe08829b13e843b8d8ae682'
         '480577daf0602cd5eabac698a4a2e310'
         '6ce8b7fef6432184d50124e26991a374')

_profile="accuracyfast" 
 
pkgver() {
        cd "higan"
        echo 094.$( git describe --always | sed 's#-#_#g;s#v##' )
}
 
prepare(){
        cd "${srcdir}/higan"

        #Check out a specific commit (rollback)
        #git checkout 4e2eb23

        #Local patches (testing before adding to git)
        #Higan-mercury's inline spam (not useful with pgo?)
        patch -Np1 < "${srcdir}/mercury.patch"

        #Force Super FX2 Clock (contraversial benefit)
        patch -Np2 < "${srcdir}/super-fx-hax.patch"

        #Append user's CXXFLAGS and LDFLAGS
        sed -i "\|^flags += -I. -O3 -fomit-frame-pointer| s|$| -std=gnu++11 $CXXFLAGS|" Makefile
        sed -i "\|^link +=| s|$| $LDFLAGS|" Makefile
}
 
build(){
        cd "${srcdir}/higan"

# libananke
        make \
        compiler=g++ \
        platform=linux \
        -C ananke
 
# higan
        # Normal build
        make \
        compiler=g++ \
        platform=linux \
        target=higan \
        profile=${_profile} \
        name=higan-${_profile}

        # Profile Guided Optimization build
        #
        # Build with profile generation
        make pgo=instrument compiler=g++ platform=linux target=higan profile=${_profile} name=higan-${_profile}
        #
        # Run all cores and SFC special chips (except the new (famicom variant) nSide systems (Playchoice 10, VS System))
        "${srcdir}/profilebatch" "out/higan-${_profile}" "/home/${USER}/Emulation/"
        #
        # Build with profile analysis
        make clean
        make pgo=optimize compiler=g++ platform=linux target=higan profile=${_profile} name=higan-${_profile}
}

package_libananke(){
        cd "${srcdir}/higan"
	#if [ ! -d ~/.config/ananke ]; then install -d ~/.config/ananke; fi
        make DESTDIR=${pkgdir} prefix=/usr/lib -C ananke install
}

package_higan-qq(){
        provides=(higan{,-qq})
        conflicts=('higan' 'bsnes')
        makedepend=('libao' 'git' 'gtksourceview2')
        depends=('openal' 'libgl')
        optdepends=('alsa' 'pulseaudio' 'sdl')
        cd "${srcdir}/higan"
        make DESTDIR=${pkgdir} prefix=/usr/ name=higan-${_profile} install
}

