# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>

pkgname=simcity-3000-gog
_pkgname=simcity3000
pkgver=2.0
_pkgver=2.0.0.3
pkgrel=2
pkgdesc="SimCity 3000 Linux with data via GOG"
arch=('i686' 'x86_64')
url="https://www.gog.com/game/simcity_3000"
license=('custom')
depends=('ossp')
makedepends=('innoextract' 'icoutils' 'perl-rename')
install=simcity3000.install
source=("setup_simcity3k_unlimited_${_pkgver}.exe::gogdownloader://simcity_3000/en1installer1"
        "https://files.gog.com/support/SC3U.zip"
        "https://github.com/jm2/archlinux-package-simcity-3000-gog/raw/master/sc3-lnx-support.tar.bz2"
        "http://www.improbability.net/loki/loki_compat_libs-1.5.tar.bz2"
        "https://github.com/liflg/sc3u_2.0a-multilingual_x86/archive/refs/heads/master.zip"
        "${_pkgname}.desktop" "${_pkgname}.sh")
sha256sums=('84a73753d9aa6e8e4e8097adec18fc4ea8d897dd9a2dc67d23463cf6338be280'
            '122fd83f099c80929cbdc3602a3155d448b7f8879f632583060e61144c553b33'
            'c55292c7bd183b8fc54b6c7e0ec9c53fc3657e759603cc5a174d83803b288de0'
            '60932597d4ee94f0b629d7194774c2b9ce867f9519887d85e98eea84577c0e46'
            '0f4aa72d88022f39501773c10fe5dc175795d7c3281f2197655dc5810b7eea8e'
            '7b457a4ac29c48e8811e16db5d9fbf4f93e16ed5be2de92dc8b80f1c14c4e0d7'
            'b8b034ebc75d10899ae9cef073675222bc592e2051875c85b5811f04b05ec6a8')

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('goggogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find gog installer file (%u). Manually download it to \"$(pwd)\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf. See PKGBUILD for example.")

prepare() {
    innoextract --gog -s "setup_simcity3k_unlimited_${_pkgver}.exe"
    icotool -x -o . app/goggame-*.ico
}

package() {
    mkdir -p $pkgdir/opt/${_pkgname}

    # Install game icon.
    install -Dm644 "${srcdir}/goggame-2086050016_6_256x256x32.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}-gog.png"

    # Install game data.
    cp -r $srcdir/app/* $pkgdir/opt/${_pkgname}/

    # Fix case-sensitivity issues.
    perl-rename 'y/A-Z/a-z/' $pkgdir/opt/${_pkgname}/*
    perl-rename 'y/A-Z/a-z/' $pkgdir/opt/${_pkgname}/apps/*
    find $pkgdir/opt/${_pkgname}/apps/{res,sys,barender,bacustom} -execdir perl-rename 'y/A-Z/a-z/' '{}' \+
    find $pkgdir/opt/${_pkgname}/cities -type d -execdir perl-rename 'y/A-Z/a-z/' '{}' \+
    mv $pkgdir/opt/${_pkgname}/cities/TUTORIAL.SC3 $pkgdir/opt/${_pkgname}/cities/Tutorial.sc3
    perl-rename 's/\.([^.]*)$/.\L$1/' $pkgdir/opt/${_pkgname}/cities/scenarios/*.SNR

    # Install compat data.
    cp $srcdir/sc3u_2.0a-multilingual_x86-master/data/*.sh $pkgdir/opt/${_pkgname}/
    cp -r $srcdir/Loki_Compat $pkgdir/opt/${_pkgname}/
    ln -s apps/{bacustom,barender,res,sys} $pkgdir/opt/${_pkgname}/
    mv $pkgdir/opt/${_pkgname}/apps/sc3u.exe $pkgdir/opt/${_pkgname}/apps/sc3u.exe.orig
    cp $srcdir/SC3U.exe $pkgdir/opt/${_pkgname}/apps/sc3u.exe # Not used by default but enables higher resolutions if WINE is used.
    mkdir -p $pkgdir/opt/${_pkgname}/apps/res/sound/radio/stations
    cp $srcdir/sc3-lnx-support/sc3u.ini $pkgdir/opt/${_pkgname}/
    cp $srcdir/sc3-lnx-support/sys-gog-paths-fixed.pak $pkgdir/opt/${_pkgname}/apps/sys/sys.pak
    cp $srcdir/sc3-lnx-support/csattrib_korea.ixf $pkgdir/opt/${_pkgname}/apps/res/sprites/csattrib_korea.ixf
    cp $srcdir/sc3-lnx-support/occupantattribs_korea.ixf $pkgdir/opt/${_pkgname}/apps/res/occupant/occupantattribs_korea.ixf
    cp $srcdir/sc3-lnx-support/audio.ini $pkgdir/opt/${_pkgname}/apps/res/sound/audio.ini
    cp $srcdir/sc3-lnx-support/3kg2.xa $pkgdir/opt/${_pkgname}/apps/res/sound/music/3kg2.xa

    # Install core linux data.
    cd $pkgdir/opt/${_pkgname}/
    tar xvf $srcdir/sc3u_2.0a-multilingual_x86-master/data/patch-2.0a.tar
    rm lib/libSimBABld.so # Causes startup breakage; removing probably breaks BA but better than nothing.

    # Install desktop file.
    install -D -m 644 $srcdir/${_pkgname}.desktop \
             $pkgdir/usr/share/applications/${_pkgname}.desktop

    # Install bash startup script.
    install -D -m 755 $srcdir/${_pkgname}.sh \
             $pkgdir/usr/bin/${_pkgname}
}
