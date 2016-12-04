# Maintainer:  ahjolinna <@yahoo.com>

# WARNING: The configure script will automatically enable any optional
# features it finds support for on your system. If you want to avoid
# linking against something you have installed, you'll have to disable
# it in the configure below. The package() script will attempt to
# update the dependencies based on dynamic libraries when packaging.

pkgname=mpv-ahjolinna-git
_gitname=mpv
pkgver=44200.g796b48b
pkgrel=1
pkgdesc='Video player based on MPlayer/mplayer2 (git version)'
arch=('x86_64')
license=('GPL3')
url='http://mpv.io'
_undetected_depends=('desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
depends=('pulseaudio' 'ffmpeg' 'lcms2' 'libdvdread' 'libgl' 'libvdpau'
         'libxinerama' 'libxv' 'libxkbcommon' 'libva'  'libass' 'uchardet' 
	 'wayland' 'v4l-utils' 'luajit' 'libdvdnav' 'libcdio-paranoia' 'libbluray' 'libxss'
         'enca' 'libguess' 'harfbuzz' 'libxrandr' 'rubberband' 'smbclient' "${_undetected_depends[@]}")

optdepends=('ttf-soure-sans-pro:  needed for subtitles'
            'youtube-dl: Another way to view youtuve videos with mpv'
            'zsh-completions: Additional completion definitions for Zsh users'
            'livestreamer: to watch live video streams (twitch.tv)'
            'vapoursynth-plugin-mvtools: Realtime motion interpolating playback in mpv'
            'acpitool: for battery detection'
            'inxi: HIDPI-detection'
            'svp: SmoothVideo Project' )

makedepends=('mesa' 'python-docutils' 'ladspa' 'x264' 'x265' 'openal' 'jack'
             'samba' 'acpitool' 'waf' 'inxi' 'git' 'vapoursynth'
             'livestreamer' 'youtube-dl')
# check kind of graphic card
if [ -f /usr/bin/nvidia-settings ]||[ $_vdpau = 1 ]|| [ -f /usr/lib/xorg/modules/drivers/nouveau_drv.so ]; then
   # msg "installing libvdpau for NVIDIA users" 
makedepends+=('libvdpau')
optdepends+=('libvdpau: hardware-acceleration for NVIDIA users')
   elif [ -f /usr/bin/aticonfig ]||[ $_vdpau = 1 ]|| [ -f /usr/lib/xorg/modules/drivers/radeon_drv.so ]; then
    msg "installing libvdpau for Radeon users" 
makedepends+=('libvdpau')
optdepends+=('libvdpau: hardware-acceleration for Radeon users')
else
    msg "installing libva for hardware-acceleration support for opensource driver users " 
makedepends+=('libva')
optdepends+=('libva: for open source driver users')
    fi
    
  provides=('mpv=1:0.22.0')
conflicts=('mpv' 'mpv-vapoursynth' 'mpv-ahjolinna-build-git' 'mpv-build-git' )
options=('!emptydirs')
source=('git+https://github.com/mpv-player/mpv'
        'find-deps.py'
         "ftp://ftp.ritual.org/common/ColorManagement/BT.709_Profiles.zip"
         "https://github.com/ahjolinna/mpv-conf/raw/master/PKGBUILD/mpv.tar.gz"
        'mpv-hq.desktop'
         'mpv-lq.desktop'
         'mpv-mq.desktop'
         'mpv-MVtools.desktop')

sha256sums=('SKIP'
            'ce974e160347202e0dc63f6a7a5a89e52d2cc1db2d000c661fddb9dc1d007c02'
            'd53aa2c59350a8e364b1a18a5509ba995826f7d37e34ad029251bee082f3c360'
            'cc980774d9ded3c3d8dc7e6bb775285b50ce1558840becaee14f8084173a284a'
            'ddd18dbccdaa4513586cb97299e88564e3289940f25d7ebe762c4482fbad3809'
            'e02f7b07653ea4ce9745b9f699954f5a4eafd416ada5a5d032c7dd7294921f90'
            '8cf41f23572417836084209fce343f779e72dea9688dc84e23e8eb913d002d5f'
            'b4a5a64a84c5be668de880d7199195e2e476f980b1e719743931665a7c3ec8bf')

pkgver() {
  cd "$srcdir/$_gitname"
  #_curtag="$(git rev-list --tags --max-count=1)"
  #_tagver="$(git describe --tags $_curtag | sed -e 's:^v::' -e 's:-:_:g')"
  #_commits="$(git rev-list --count HEAD --since=$_tagver)"
  #_sha="$(git rev-parse --short HEAD)"
  #printf "%s.%s.g%s" $_tagver $_commits $_sha
  echo "$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  ./bootstrap.py
}

build() {
  cd "$srcdir/$_gitname"

  CFLAGS="$CFLAGS -I/usr/include/samba-4.0"
  
msg "cheking if VPDAU or VAAPI will be enabled or disabled" 
if [[ $_libvdpau = 1 ]] || [ -f /usr/bin/nvidia-settings ] ; then
      _vdpau="--enable-vdpau"
      _hwaccel="--enable-vdpau-hwaccel"
      _vaapi=""
      
  elif [[ $_libvdpau = 1 ]] | [ -f /usr/bin/aticonfig ]|[ -f /usr/lib/xorg/modules/drivers/radeon_drv.so ]; then
        _vdpau="--enable-vdpau"
        _hwaccel="--enable-vdpau-hwaccel"
      _vaapi=""
  else
     _vdpau=""
       _vaapi="--enable-vaapi"
       _hwaccel="--enable-vaapi-hwaccel"
  fi

 ./waf configure \
    --prefix=/usr \
  --confdir=/etc/mpv \
  --disable-test \
  --disable-build-date \
  --enable-libmpv-shared \
  --enable-openal \
  --disable-sdl1 \
  --enable-sdl2 \
  --enable-libmpv-shared \
  --enable-zsh-comp \
  --enable-pulse \
  --enable-egl-x11 \
  --enable-wayland \
  $_vdpau \
  $_hwaccel \
  $_vaapi \
  --enable-libsmbclient \
  --enable-dvdread \
  --enable-libarchive \
  --lua=luajit \
  --enable-libavdevice \
  --enable-vapoursynth
./waf build
}

package() {
  cd "$srcdir/$_gitname"
  ./waf install --destdir="${pkgdir}" 


 # install the .desktop files
  install -Dm644 "${srcdir}/mpv-lq.desktop" "${pkgdir}/usr/share/applications/mpv-lq.desktop"
  install -Dm644 "${srcdir}/mpv-mq.desktop" "${pkgdir}/usr/share/applications/mpv-mq.desktop"
  install -Dm644 "${srcdir}/mpv-hq.desktop" "${pkgdir}/usr/share/applications/mpv-hq.desktop"
  install -Dm644 "${srcdir}/mpv-MVtools.desktop" "${pkgdir}/usr/share/applications/mpv-MVtools.desktop"
  
  
  # install BT.709 ICC profiles (https://github.com/mpv-player/mpv/issues/534#issuecomment-35823203)
   install -Dm755 "${srcdir}/BT.709_Profiles/BT.709.gamma.1.95.icc" "${pkgdir}/usr/share/color/icc/BT.709_Profiles/BT.709.gamma.1.95.icc"
   install -Dm755 "${srcdir}/BT.709_Profiles/BT.709.gamma.1.95.icc" "${pkgdir}/usr/share/color/icc/BT.709_Profiles/BT.709.icc"
   install -Dm755 "${srcdir}/BT.709_Profiles/BT.709.gamma.1.95.icc" "${pkgdir}/usr/share/color/icc/BT.709_Profiles/BT.709.linear.icc"
  
  
    #install ahjolinna "config-build" files
 cp -R ${srcdir}/mpv/etc*/* ${pkgdir}/etc/mpv
    install -d "${pkgdir}/etc/mpv/"
  

  # Update dependencies automatically based on dynamic libraries
  _detected_depends=($("$srcdir"/find-deps.py "$pkgdir"/usr/{bin/mpv,lib/libmpv.so}))
  msg 'Auto-detected dependencies:'
  echo "${_detected_depends[@]}" | fold -s -w 79 | sed 's/^/ /'
  depends=("${_detected_depends[@]}" "${_undetected_depends[@]}")
}
