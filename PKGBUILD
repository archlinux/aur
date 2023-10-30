# Maintainer: Ronald Record <github@ronrecord.com>

pkgname=musicplayerplus
pkgver=v3.0.1r3
pkgrel=2
pkgdesc="Character based MPD client, spectrum visualizer, Beets library management, Mopidy and Navidrome servers, plus more"
arch=('any')
url="https://github.com/doctorfree/MusicPlayerPlus"
license=('MIT')
depends=(util-linux bc boost-libs coreutils curl dialog flac jq libcurl-compat libmpdclient ncurses readline taglib mediainfo mpd ffmpeg4.4 inotify-tools figlet tmux fzf mpc python python-pip python-numpy python-six mplayer eigen fftw clang libsamplerate chromaprint iniparser libyaml swig alsa-lib alsa-utils libpulse sndio sqlite qt5-base wget wmctrl xorg-xdpyinfo xorg-xprop xorg-xrandr yt-dlp imagemagick)
makedepends=(git pandoc zip)
optdepends=('cool-retro-term: cool retro terminal emulator')
install=musicplayerplus.install
source=("${pkgname}::git+https://github.com/doctorfree/MusicPlayerPlus.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
}

build() {
  cd "${srcdir}/${pkgname}"
}

package() {
  cd "${srcdir}/${pkgname}"
  destdir=usr
  for dir in "${destdir}" "${destdir}/share" "${destdir}/share/man" \
    "${destdir}/share/man/man1" "${destdir}/share/man/man5" \
    "${destdir}/share/applications" "${destdir}/share/doc" \
    "${destdir}/share/doc/${pkgname}" "${destdir}/share/${pkgname}" \
    "${destdir}/share/${pkgname}/mpcplus" \
    "${destdir}/share/licenses" \
    "${destdir}/share/licenses/${pkgname}"
  do
    [ -d ${pkgdir}/${dir} ] || mkdir ${pkgdir}/${dir}
  done

  for dir in bin
  do
    [ -d ${pkgdir}/${destdir}/${dir} ] && rm -rf ${pkgdir}/${destdir}/${dir}
  done

  cp -a bin ${pkgdir}/${destdir}/bin

  cp *.desktop "${pkgdir}/${destdir}/share/applications"
  cp copyright ${pkgdir}/${destdir}/share/doc/${pkgname}
  cp LICENSE ${pkgdir}/${destdir}/share/doc/${pkgname}
  cp LICENSE ${pkgdir}/${destdir}/share/licenses/${pkgname}
  cp AUTHORS ${pkgdir}/${destdir}/share/doc/${pkgname}
  cp CHANGELOG.md ${pkgdir}/${destdir}/share/doc/${pkgname}
  cp README.md ${pkgdir}/${destdir}/share/doc/${pkgname}
  pandoc -f gfm README.md | tee ${pkgdir}/${destdir}/share/doc/${pkgname}/README.html > /dev/null
  gzip -9 ${pkgdir}/${destdir}/share/doc/${pkgname}/CHANGELOG.md

  cp -a share/alsa-capabilities ${pkgdir}/${destdir}/share/doc/${pkgname}/alsa-capabilities

  cp asound.conf.tmpl ${pkgdir}/${destdir}/share/${pkgname}
  cp config/default_cover.png ${pkgdir}/${destdir}/share/${pkgname}/mpcplus
  cp config/fzmp.conf ${pkgdir}/${destdir}/share/${pkgname}/mpcplus

  cp -a share/scripts ${pkgdir}/${destdir}/share/${pkgname}/scripts
  cp -a share/calliope ${pkgdir}/${destdir}/share/${pkgname}/calliope

  cp config/xterm-24bit.src ${pkgdir}/${destdir}/share/${pkgname}
  cp config/tmux.conf ${pkgdir}/${destdir}/share/${pkgname}

  cp config/mpprc ${pkgdir}/${destdir}/share/${pkgname}

  cp -a config/beets "${pkgdir}/${destdir}/share/${pkgname}/beets"
  cp -a beets "${pkgdir}/${destdir}/share/${pkgname}/beets/plugins"
  cp config/calliope/* "${pkgdir}/${destdir}/share/${pkgname}/calliope"
  cp -a config/kitty "${pkgdir}/${destdir}/share/${pkgname}/kitty"
  cp -a config/mopidy "${pkgdir}/${destdir}/share/${pkgname}/mopidy"
  cp -a config/mpd "${pkgdir}/${destdir}/share/${pkgname}/mpd"
  cp -a config/mppcava "${pkgdir}/${destdir}/share/${pkgname}/mppcava"
  cp -a config/navidrome "${pkgdir}/${destdir}/share/${pkgname}/navidrome"
  cp -a config/ncmpcpp "${pkgdir}/${destdir}/share/${pkgname}/ncmpcpp"
  cp -a config/pipewire "${pkgdir}/${destdir}/share/${pkgname}/pipewire"
  cp -a config/tmuxp ${pkgdir}/${destdir}/share/${pkgname}/tmuxp
  cp -a config/ueberzug ${pkgdir}/${destdir}/share/${pkgname}/mpcplus/ueberzug
  cp -a config/yt-dlp "${pkgdir}/${destdir}/share/${pkgname}/yt-dlp"
  cp -a music "${pkgdir}/${destdir}/share/${pkgname}/music"

  for mp in mppplasma listyt alsa_conf mppsplash mpprocks mpd-configure scdl \
            alsa-capabilities mpd-monitor fzmp mppcover mppinit mpplus mppdl \
            bandcamp-dl mpcplus-tmux mppsplash-tmux mppjulia create_playlist
  do
    cp man/man1/${mp}* ${pkgdir}/${destdir}/share/man/man1
  done
  cp man/man5/mpprc* ${pkgdir}/${destdir}/share/man/man5
  cp -a share/menu "${pkgdir}/${destdir}/share/menu"

  [ -f .gitignore ] && {
    while read ignore
    do
        rm -f ${pkgdir}/${destdir}/${ignore}
    done < .gitignore
  }

  chmod 644 ${pkgdir}/${destdir}/share/man/*/*
  chmod 644 ${pkgdir}/${destdir}/share/menu/*
  chmod 755 ${pkgdir}/${destdir}/bin/* \
            ${pkgdir}/${destdir}/bin \
            ${pkgdir}/${destdir}/share/man \
            ${pkgdir}/${destdir}/share/man/* \
            ${pkgdir}/${destdir}/share/${pkgname}/scripts/*
}
