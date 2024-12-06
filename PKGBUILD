# Maintainer: envolution
# Contributor: Felix Braun <hazzl@falix.de>
# Contributor: Laurinyecz Zalán <laurinyeczzalan@gmail.com>
# Contributor: Ernesto Castellotti <mail@ernestocastellotti.it>

pkgname=boosteroid
pkgver=1.9.10
pkgrel=4
pkgdesc="Boosteroid client desktop"
arch=('x86_64')
url="https://boosteroid.com/downloads"
license=('custom')
options=(!debug)
depends=("libva" "libvdpau" "libxcb" "traceroute" "ocl-icd" "pcre2" "libxi" "xcb-util-wm" "xcb-util-image" "xcb-util-renderutil" "xcb-util-keysyms" "xcb-util-keysyms" "fontconfig" "alsa-lib" "pulseaudio-alsa")
makedepends=("binutils" "tar" "coreutils" "wget")

_custom_name="${pkgname^}-${pkgver}-${CARCH}"

# Set Mozilla as curl useragent to circumvent 403 using curl
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

source=(
    "${_custom_name}.deb::https://boosteroid.com/linux/installer/boosteroid-install-x64.deb"
    "${_custom_name}.md5::https://boosteroid.com/linux/installer/boosteroid-install-x64.md5"
    boosteroid.sh
)
md5sums=('2187075bc01bd8543ef534ab2728e69f'
         'e36043a2e4751794e8903e0cc3a71325'
         '033cc5b68298d0fe7d36887b5db6f200')
noextract=("${_custom_name}.deb")

prepare() {
  #prep deb file for installation
  msg2 "Decompressing Debian package..."
  ar xv "${_custom_name}.deb" > /dev/null
  tar -xf data.tar.bz2 > /dev/null
  tar -xf control.tar.gz > /dev/null

  #Versioning confirmation and MD5 verification
  local _version
  _version=$(grep -oP "Version: \K[0-9.]+" ./control)
  msg2 "Detected Debian package version ${_version} ..."
  msg2 "PKGBUILD package version ${pkgver} ..."
  [ "${_version}" != "${pkgver}" ] && exit 1
  msg2 "Checking boosteroid accompanied archive md5 against downloaded installer..."
  md5sum -c "${_custom_name}.md5" > /dev/null

  #this is the system desktop, which later becomes obsolete as the binary creates a user version in $HOME
  msg2 "Customising desktop file..."
  sed -i "s/Exec=.*/Exec=\/usr\/bin\/${pkgname}/g" usr/share/applications/Boosteroid.desktop
  sed -i "s/Icon=.*/Icon=\/usr\/share\/icons\/hicolor\/scalable\/apps\/${pkgname}.svg/g" usr/share/applications/Boosteroid.desktop
}

package() {
  install -dm755 "$pkgdir"/usr/bin
  install -dm755 "$pkgdir"/usr/share/icons/hicolor/scalable/apps
  install -dm755 "$pkgdir"/usr/share/{applications,icons/Boosteroid,licenses/Boosteroid}
  install -m755  "opt/BoosteroidGamesS.R.L./bin/Boosteroid" "$pkgdir"/usr/bin/"$pkgname".bin #Isolate the binary for our wrapper boosteroid.sh
  install -m755  boosteroid.sh                              "$pkgdir"/usr/bin/"${pkgname^}"  #The program binary creates a user desktop file pointing to /usr/bin/Boosteroid
  ln      -s     "${pkgname^}"                              "$pkgdir"/usr/bin/"${pkgname}"   #we link to /usr/bin/boosteroid
  install -m644 usr/share/applications/Boosteroid.desktop   "$pkgdir"/usr/share/applications/Boosteroid.desktop
  install -m644 usr/share/icons/Boosteroid/icon.svg         "$pkgdir"/usr/share/icons/hicolor/scalable/apps/boosteroid.svg
  install -m644 opt/BoosteroidGamesS.R.L./bin/ToU.txt       "$pkgdir"/usr/share/licenses/Boosteroid/ToU.txt
}

