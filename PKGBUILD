# Maintainer: Alex Tharp <alex@toastercup.io>
_appname=firestorm-next
pkgname="${_appname}-bin"
pkgver=7.1.4.73289
pkgrel=1
pkgdesc="[PRE-RELEASE] Firestorm is a feature-packed third-party viewer for Second Life. This is the *alpha* release that currently features PBR support. **USE AT YOUR OWN RISK**"
url="http://www.firestormviewer.org/"
license=('GPL')
arch=('x86_64')
depends=(apr-util dbus-glib glu gtk2 lib32-libidn lib32-libsndfile
         lib32-util-linux lib32-zlib libbsd libgl libidn libjpeg-turbo
         libpng libxcrypt-compat libxss libxml2 mesa nss openal sdl
         vlc zlib)
optdepends=(
  'alsa-lib: for ALSA support'
  'pepper-flash: for inworld Flash support'
  'freealut: for OpenAL support'
  'gstreamer: For video support - may need good, bad and ugly plugins'
  'lib32-gst-plugins-good: for voice support'
  'lib32-libidn11: for voice support'
  'libpulse: for PulseAudio support'
  'mesa-libgl: For Intel, Radeon, Nouveau support'
  'nvidia-libgl: for NVIDIA support'
  'nvidia-utils: for NVIDIA support')
install="${_appname}.install"
source=("${_appname}.desktop"
        "${_appname}.launcher")
md5sums=('bdf52344099529a7006ea67426239182'
         '6a56b1a0df5960481ad40ed40dca8f91')
_tar_md5sum='db4d03c6f026ea46da18dfba64adb76e' # verified in prepare()

# Text formatting
_bold_font_weight=$(tput bold)
_normal_font_weight=$(tput sgr0)
_red_font_color=$(tput setaf 1)
_reset_font_color=$(tput sgr0)

prepare() {
  printf "\nPlease obtain the private URL for version ${pkgver} of Firestorm by joining the Firestorm Preview group and looking under the \"Linux for Second Life (64-bit)\" section in the attached notecard of the most recent alpha/beta notice. ${_bold_font_weight}Do ${_red_font_color}not${_reset_font_color}${_bold_font_weight} share this URL.\n\n"
  printf "${_bold_font_weight}Group URL: ${_normal_font_weight}https://my.secondlife.com/groups/7ba4569c-9dd9-fed2-aaa7-36065d18a13c\n"
  printf "${_bold_font_weight}Inworld Group URI: ${_normal_font_weight}secondlife:///app/group/7ba4569c-9dd9-fed2-aaa7-36065d18a13c/about\n\n"
  printf "${_bold_font_weight}Enter the download URL here:${_normal_font_weight} "
  read -r _url

  _tardir=$(basename "${_url}" .tar.xz)
  echo "${_tardir}" > "${srcdir}/.tardir" # needed in package()

  # Download and verify
  curl -o "${srcdir}/${_tardir}.tar.xz" "$_url"
  if ! echo "${_tar_md5sum} ${srcdir}/${_tardir}.tar.xz" | md5sum -c --status; then
    printf "${_bold_font_weight}${_red_font_color}==> ERROR:${_reset_font_color} ${_bold_font_weight}The file downloaded from the provided URL did not pass the validity check!\n" >&2
    return 1
  fi

  cd "${srcdir}"
  tar -xf "${_tardir}.tar.xz"
}

package() {
  read -r _tardir < "${srcdir}/.tardir"

  install -d "${pkgdir}/usr/lib"
  cp -a "${srcdir}/${_tardir}" "${pkgdir}/usr/lib/${_appname}"
  cd "${pkgdir}/usr/lib/${_appname}"

  find app_settings skins -type f -execdir chmod 644 "{}" +

  # find and remove broken symlinks
  find -L . -type l -delete

  # Install desktop file
  install -D -m644 "${srcdir}/${_appname}.desktop" \
          "$pkgdir/usr/share/applications/${_appname}.desktop"

  # Install icon file
  install -D -m644 firestorm_icon.png \
          "$pkgdir/usr/share/pixmaps/${_appname}.png"

  # Install launcher
  install -D -m755 "${srcdir}/${_appname}.launcher" \
          "$pkgdir/usr/bin/${_appname}"
}
