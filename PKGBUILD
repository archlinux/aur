# Maintainer: Joseph Lansdowne <J49137@gmail.com>
# Forked from dustforce-hib
#     Commit: https://aur.archlinux.org/cgit/aur.git/commit/?h=dustforce-hib&id=652033563defbd0b002b57a14ab0b4070714e9a4
#     Author: Sam S. <smls75@gmail.com>

# URL used for version checking: http://dustkid.com/backend8/dustmod_version.php

pkgname=dustforce-hib-dustmod
pkgver=1.0+h20141222_8.7.1
_hibver=2014-12-22
_hibver_windows=07012015
pkgrel=2
pkgdesc='A fast-paced 2D action platformer (Humble Bundle version, with Dustmod)'
url='https://dustkidblog.wordpress.com/2016/11/19/dustmod-has-updated/'
arch=('x86_64')
license=('custom:commercial')
depends=('mesa' 'libgl' 'sdl2' 'libxdamage' 'freealut' 'libidn-133-compat'
         'libvorbis' 'libxft' 'xdg-utils' 'openssl-1.0')
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

_installer="Dustforce-Linux-${_hibver}.sh"
_installer_windows="dustforce_dx_${_hibver_windows}.zip"
source=("hib://${_installer}"
        "hib://${_installer_windows}"
        'http://dustkid.com/getdustmod/linux64_drmfree'
        'dustmod-patch::http://dustkid.com/backend8/dustmod_package4.php?platform=linux64_drmfree'
        'dustforce-dustmod'
        'dustforce-hib-dustmod.desktop')
md5sums=('e2fa7efd5b9ec64fc453f32480f63ad4'
         'fed1b6d82bdbea66d242eaaaf7d3a2f2'
         '3ff88e9ab893e3b8134ec0bc055661a3'
         '57cd567244083547984d3b30afa2a23a'
         '7b30db080ff59c0eba443b14da7c39bc'
         'cc98a6127bc6d6cbdcfced14c69327cf')
# zip with no top-level directory - will extract manually
noextract=('linux64_drmfree')


# extracts a Dustmod patch archive into the given directory
# I haven't worked out any existing archive format that this uses, so this is a
# simple inline implementation
unarchive-patch () {
    in="$1"
    out="$2"

    cat "$in" | while true; do
        read -n 8 path_len_hex || break
        read -n 8 data_len_hex || break
        printf -v path_len "%d" "0x$path_len_hex"
        printf -v data_len "%d" "0x$data_len_hex"
        read -n "$path_len" path
        mkdir -p "$(dirname "$out/$path")"
        echo $path
        if [ "$path" = "dustmod.bin.x86_64_dustmod" ]; then
            dest="$out/dustmod.bin.x86_64"
        else
            dest="$out/$path"
        fi
        head -c "$data_len" > "$dest"
    done
}

package() {
      cd "$srcdir"
      _installdir=/opt/dustforce-dustmod; _target="$pkgdir"/"$_installdir"

      # install game files
      mkdir -p "$pkgdir"/"$_installdir"
      cp -TRl data/noarch "$pkgdir"/"$_installdir"
      cp -TRl data/x86_64 "$pkgdir"/"$_installdir"

      # include missing music track from Windows version
      ln {"Dustforce DX","$pkgdir"/"$_installdir"}/"content/audio/music/Sun Bleach.ogg"

      # install Dustmod
      unzip -q "$srcdir"/linux64_drmfree -d "$pkgdir"/"$_installdir"/
      # Apply Dustmod updates, which aren't distributed in the main download
      unarchive-patch "$srcdir"/dustmod-patch "$pkgdir"/"$_installdir"

      # Dustmod expects a version of curl we can't really obtain, but works with
      # the version distributed with Dustforce
      pushd "$pkgdir"/"$_installdir"/"lib64" > /dev/null
      ln -s libcurl.so.{3,4}
      popd > /dev/null

      # fix permissions
      find "$pkgdir" -type d -exec chmod 755 "{}" +
      find "$pkgdir" -type f -exec chmod 644 "{}" +
      chmod 755 "$_target"/Dustforce.bin.x86_64
      chmod 755 "$_target"/dustmod.bin.x86_64

      # install icon & desktop entry
      install -Dm644 data/noarch/Dustforce.png \
                     "$pkgdir"/usr/share/pixmaps/dustforce-dustmod.png
      install -Dm644 "$pkgname".desktop \
                     "$pkgdir"/usr/share/applications/"$pkgname".desktop

      # install launcher
      install -d "$pkgdir"/usr/bin
      install -Dm755 dustforce-dustmod "$pkgdir"/usr/bin/dustforce-dustmod
}
