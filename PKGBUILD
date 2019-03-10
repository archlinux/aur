pkgbase=higan-qq
pkgname=('higan-qq' 'libananke')
pkgver=094.8d4b3cfa
pkgrel=4
pkgdesc="A Nintendo multi-system emulator with quequotion's customizations"
arch=('i686' 'x86_64')
url=https://github.com/quequotion/higan-qq
license=(GPL)
replaces=('higan-qq-git')
makedepends=('git' lib{ao,pulse,x{11,v}} gtk{,sourceview}2 {sd,mesa-libg,opena}l)
source=('higan::git+https://github.com/quequotion/higan-qq.git'
	'profilebatch'
        'super-fx-hax.patch'
        'mercury.patch')
install=higan.install
md5sums=('SKIP'
         '42cf726affe08829b13e843b8d8ae682'
         '480577daf0602cd5eabac698a4a2e310'
         '6ce8b7fef6432184d50124e26991a374')

#Accuracyfast swapps byuu's functionally accurate dsp for
#blarrg's output-accurate dsp; allegedly improving performance.
#Keep in mind, the purpose is to run bsnes at 60fps for playing games
#not TAS, but only because Bizhawk is beyond my understanding (087?).

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
}

build(){
        cd "${srcdir}/higan"

        #Append user's CXXFLAGS and LDFLAGS
        sed -i "\|^flags :=| s|$| $CFLAGS|" nall/Makefile
        sed -i "\|^link :=| s|$| $LDFLAGS|" nall/Makefile

# libananke
        make \
        compiler=g++ \
        platform=linux \
        -C ananke

# higan
        make \
        compiler=g++ \
        platform=linux \
        target=higan \
        profile=${_profile} \
        name=higan-${_profile}
}

package_libananke(){
        pkgdesc+=" (rom importing library)"
        cd "${srcdir}/higan"
	#if [ ! -d ~/.config/ananke ]; then install -d ~/.config/ananke; fi
        make DESTDIR=${pkgdir} prefix=/usr/lib -C ananke install
}

package_higan-qq(){
        pkgdesc+=" (multi-fork emulator)"
        provides=(higan{,-qq})
        conflicts=('higan' 'bsnes')
        depends=('openal' 'libgl')
        optdepends=('alsa' 'pulseaudio' 'sdl')
        cd "${srcdir}/higan"
        make DESTDIR=${pkgdir} prefix=/usr/ name=higan-${_profile} install
}

