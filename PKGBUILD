# Maintainer: rafaelff <rafaelff@gnome.org>

pkgname=buzztrax
pkgver=0.10.2
pkgrel=3
pkgdesc="Modular music composer for Linux"
arch=('x86_64')
url="https://www.buzztrax.org/"
license=('LGPL-2.1-or-later' 'GFDL-1.1-or-later')
depends=('clutter-gtk' 'gst-plugins-base-libs' 'libgsf')
makedepends=('fluidsynth' 'gobject-introspection' 'intltool' 'rarian' 'gtk-doc')
replaces=('buzztard')
optdepends=(
    'gst-plugins-ugly: for the use of mp3 recording'
    'gst-plugins-bad: extra audio effects'
    'fluidsynth: to build a relates gstreamer wrapper'
)
_tag=RELEASE_$(sed 's|\.|_|g' <<< $pkgver)
source=(
    "https://github.com/Buzztrax/buzztrax/releases/download/$_tag/$pkgname-$pkgver.tar.gz"
    "0001-about-dialog-take-release-year-and-release-date-from.patch"
    "0002-build-Fix-32-bit-bml-build.patch"
    "0003-configure-add-msee-when-using-xmmintin.h.patch"
    "0004-configure-fix-the-header-name-mess.patch"
    "0005-bt-dec-rename-plugin.patch"
    "0006-gtk-update-icon-cache.patch"
    "0007-add-gobject-casts.patch"
    "0008-replace-deprecated-fluid_settings_getstr.patch"
    "0009-replace-deprecated-fluid_synth_set_midi_router.patch"
    "0010-fix-build-fluidsynth-2.patch"
    "0011-fix-udevadm-path.patch"
)
sha256sums=(
    '675ed744cd5209dda11e1d2fcd621d6ca23bf2eac89230bbd39242fe5f4000ed'
    '9e899afb9e596abffa90f4bb1062e82e0737fef0bac4eb4ce2ee5ed9e2551cae'
    '88a492689533b31cf95415496a5030db0554f337bf51c62e427090b4f708a2ce'
    'cd21a197839544335d6bc85941f9d9b4ec23a9aefaf69d38d6b7ae7a5b9c29b8'
    '60c7b6b74664572f1a45d39cce685791674297d55d6b7b20810e4547583d6620'
    '03d498940515370d0b575e403ea06f67778516053a339f7ddbc4602e534771d0'
    '37492f89792d7a914485fe0dbfc8354d65b0244bbc865929151c6b2ecbe6cb0a'
    'c2bf1fc8713c66c506992b5a26bc083dd380dab4b7ee99741b836e487de6ff8c'
    'dbf858de8747e6e63cff8e7babb2fb2442eb74bddf432063bc6b8d54ca282698'
    'ed2652eb90b03573f7cd81149915bf3e3f9694446eb53ad198ff64e52ba50f75'
    '334a43fcf82d6f756bfc93bcf9aab4a3d89901421808402556dd188edfe801f2'
    'ee2fe8f27709c846ddfe9800e3760bb47fd7c9ad30f999622d930a11d28171af'
)

prepare() {
    cd $pkgname-$pkgver
    for _patchfile in "$srcdir"/*.patch; do
        echo "Applying $(basename $_patchfile) ..."
        patch -p1 -i "$_patchfile"
    done
    autoreconf
}

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr --enable-man \
                --disable-update-{mime,desktop,icon-cache}
    make
}

package() {
    cd $pkgname-$pkgver
    make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install
}
