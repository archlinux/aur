# Maintainer: ota <code.monke.ota+aur@gmail.com>
# Contributor: bobpaul <aurpackage [at] bobpaul 'period' org>

pkgname="onehouronelife-latest"
pkgver=205.d_aa7f2276.o_7935b09d.m_01e64ba
pkgrel=1
epoch=
pkgdesc="One Hour One Life game by Jason Rohrer. Builds the latest release tagged on github"
arch=('x86_64')
url="http://onehouronelife.com"
license=('custom:Public Domain')
groups=()
depends=("imagemagick" "xclip" "sdl")
makedepends=("git")
checkdepends=()
optdepends=()
provides=()
conflicts=('onehouronelife-bin')
replaces=()
backup=()
options=()
install=
changelog=
#_tarname=${pkgname}_${pkgver}_UnixSource
#source=(http://download7.onehouronelife.com/downloads/$_tarname.tar.gz)
source=(git+https://github.com/jasonrohrer/OneLifeData7.git
        git+https://github.com/jasonrohrer/minorGems.git
        git+https://github.com/jasonrohrer/OneLife.git
        )
noextract=()
#sha256sums=('4e5aa3de6bb0eb0ad0b216e8a02bfe06a91b4cd295b8e45ef9a861078b3b8b46')
sha256sums=( 'SKIP'
             'SKIP'
             'SKIP')
validpgpkeys=()

_latestTaggedVersion='UNKNOWN'
_latestTaggedRevs='UNKNOWN'
_build='latest' #build the latest tagged (released) version
#_build='dev'   #build the latest revion; as a 'foo-git' package would
#_build='spec'  #build the version (of all 3 repos) defined in pkgver variable
prepare() {
    # This is based on pullAndBuildLatest.sh from upstream
    # http://download8.onehouronelife.com/downloads/OneLife_Live3_UnixSource.tar.gz
    # update each subrepo to the proper version and mv the working directories around
    cd OneLifeData7
    latestTaggedVersionB=`git for-each-ref --sort=-creatordate --format '%(refname:short)' --count=1 refs/tags | sed -e 's/OneLife_v//'`
    if [[ $_build == 'dev' ]]; then
        echo Checked out latest from OneLifeData7 repo
    elif [[ $_build == 'spec' ]]; then
        _drev=$(echo ${pkgver} | sed -n 's/.*d_\([[:alnum:]]*\).*/\1/p')
        echo Checkout out ${_drev} from OneLifeData7 repo
        git checkout -q ${_drev}
    else
        echo Checkout out OneLife_v$latestTaggedVersionB from OneLifeData7 repo
        git checkout -q OneLife_v$latestTaggedVersionB
    fi
    _latestTaggedRevs=$(echo "d_$(git rev-parse --short HEAD)")
    rm -rf minorGems >/dev/null || true
    rm -rf OneLife >/dev/null || true
    mv ../minorGems ./ || true
    mv ../OneLife ./ || true

    cd OneLife
    latestTaggedVersionA=`git for-each-ref --sort=-creatordate --format '%(refname:short)' --count=1 refs/tags | sed -e 's/OneLife_v//'`
    if [[ $_build == 'dev' ]]; then
        echo Checked out latest from OneLife repo
    elif [[ $_build == 'spec' ]]; then
        _orev=$(echo ${pkgver} | sed -n 's/.*o_\([[:alnum:]]*\).*/\1/p')
        echo Checkout out ${_orev} from OneLife repo
        git checkout -q ${_orev}
    else
        echo Checkout out OneLife_v$latestTaggedVersionA from OneLife repo
        git checkout -q $latestTaggedVersionA
    fi
    _latestTaggedRevs=$(echo "${_latestTaggedRevs}.o_$(git rev-parse --short HEAD)")
    cd ..

    cd minorGems
    latestTaggedVersion=`git for-each-ref --sort=-creatordate --format '%(refname:short)' --count=1 refs/tags | sed -e 's/OneLife_v//'`
    if [[ $_build == 'dev' ]]; then
        echo Checked out latest from minorGems repo
    elif [[ $_build == 'spec' ]]; then
        _mrev=$(echo ${pkgver} | sed -n 's/.*m_\([[:alnum:]]*\).*/\1/p')
        echo Checkout out ${_mrev} from minorGems repo
        git checkout -q ${_mrev}
    else
        echo Checkout out OneLife_v$latestTaggedVersion from minorGems repo
        git checkout -q $latestTaggedVersion
    fi
    _latestTaggedRevs=$(echo "${_latestTaggedRevs}.m_$(git rev-parse --short HEAD)")
    cd ..

    #Determine latest version
    if [[ $_build == 'spec' ]]; then
        _latestTaggedVersion=$(echo ${pkgver} | sed -n 's/\(.*\)\.d_[[:alnum:]]*.*/\1/p')
    else
        _latestTaggedVersion=$latestTaggedVersionB
        if [ $latestTaggedVersionA -gt $latestTaggedVersionB ]; then
            _latestTaggedVersion=$latestTaggedVersionA
        fi
    fi

    echo "v$_latestTaggedVersion built on $(date)" > binary.txt
    cd OneLife
    chmod u+x ./configure
    ./configure 1 
}

build() {
    cd OneLifeData7/OneLife/gameSource
    make
}

pkgver(){
    #there's 3 repos so there's 3 hashes:
    #d_HASH.o_HASH.m_HASH
    #is
    #OneLifeData7_hash.OneLife_hash.minorGems.hash
    echo "${_latestTaggedVersion}.${_latestTaggedRevs}"
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
    instdir=${pkgname%-latest}
    cd OneLifeData7
    install -Dm644 OneLife/no_copyright.txt                      "$pkgdir/usr/share/licenses/$instdir/LICENSE"
    install -Dm644 dataVersionNumber.txt                         "$pkgdir/usr/share/licenses/$instdir/"
    install -Dm755 OneLife/gameSource/OneLife                    "$pkgdir/opt/$instdir/OneLifeApp"
    install -dm777 "$pkgdir/opt/$instdir/animations"
    install -dm777 "$pkgdir/opt/$instdir/categories"
    install -dm755 "$pkgdir/opt/$instdir/graphics"
    install -dm755 "$pkgdir/opt/$instdir/ground"
    install -dm755 "$pkgdir/opt/$instdir/languages"
    install -dm755 "$pkgdir/opt/$instdir/music"
    install -dm777 "$pkgdir/opt/$instdir/objects"
    install -dm755 "$pkgdir/opt/$instdir/otherSounds"
    install -dm755 "$pkgdir/opt/$instdir/settings_default"
    install -dm755 "$pkgdir/opt/$instdir/sounds"
    install -dm777 "$pkgdir/opt/$instdir/sprites"
    install -dm777 "$pkgdir/opt/$instdir/transitions"
    install -Dm777 animations/*                                  "$pkgdir/opt/$instdir/animations"
    install -Dm777 categories/*                                  "$pkgdir/opt/$instdir/categories"
    install -Dm755 ground/*                                      "$pkgdir/opt/$instdir/ground"
    install -Dm755 music/*                                       "$pkgdir/opt/$instdir/music"
    install -Dm777 objects/*                                     "$pkgdir/opt/$instdir/objects"
    install -Dm755 sounds/*                                      "$pkgdir/opt/$instdir/sounds"
    install -Dm777 sprites/*                                     "$pkgdir/opt/$instdir/sprites"
    install -Dm777 transitions/*                                 "$pkgdir/opt/$instdir/transitions"
    install -Dm755 OneLife/gameSource/graphics/*                 "$pkgdir/opt/$instdir/graphics"
    install -Dm755 OneLife/gameSource/otherSounds/*              "$pkgdir/opt/$instdir/otherSounds"
    install -Dm755 OneLife/gameSource/settings/*                 "$pkgdir/opt/$instdir/settings_default"
    install -Dm755 OneLife/gameSource/languages/*                "$pkgdir/opt/$instdir/languages"
    install -Dm644 OneLife/gameSource/language.txt               "$pkgdir/opt/$instdir/language.txt"
    install -Dm644 OneLife/gameSource/us_english_60.txt          "$pkgdir/opt/$instdir/us_english_60.txt"
    install -Dm644 OneLife/gameSource/reverbImpulseResponse.aiff "$pkgdir/opt/$instdir/reverbImpulseResponse.aiff"
    install -Dm644 OneLife/documentation/Readme.txt              "$pkgdir/opt/$instdir/Readme.txt"
    # OHOL+ Compatibility, mostly
    install -Dm644 binary.txt                                    "$pkgdir/opt/$instdir/binary.txt"
    install -dm755 "$pkgdir/usr/local/bin/"
    install -m755  $startdir/onelife $pkgdir/opt/$instdir
    ln -s /opt/$instdir/onelife $pkgdir/usr/local/bin/onelife

}
