# Maintainer: Eugene Gorodinsky <e.gorodinsky@gmail.com>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>

pkgname=mpd-lightest
pkgver=0.21.7
_majorver=0.21
pkgrel=3
pkgdesc='"Lightest" mpd version with everything disabled. Modify PKGBUILD and enable the features and flags you need'
url='https://www.musicpd.org/'
license=('GPL')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=()
makedepends=('boost' 'meson' 'python-sphinx')
provides=("mpd=$pkgver")
conflicts=('mpd')
replaces=('mpd')
source=("https://www.musicpd.org/download/mpd/${_majorver}/mpd-${pkgver}.tar.xz"
        'mpd.tmpfile'
        'mpd.conf')
sha256sums=('512062bc529bee04d4ccfaa2c6e720afc85bb071e49850a096b5ed518b3b412c'
            'c1683ba35774c85e16c70e89f7e2ed1c09619512b1a273daabbd5e34d40439bd'
            'e213c108cd0e076b5cc07091707ef75d74d9ac8c779d0c0128cd0aa69617f8a0')
backup=('etc/mpd.conf')
install=mpd.install

prepare() {
	cd "${srcdir}/mpd-${pkgver}"
	patch --input="${srcdir}/../meson.patch"
	patch -p2 --input="${srcdir}/../ffmpeg.patch"

	install -d build
}

build() {
	cd "${srcdir}/mpd-${pkgver}/build"
	_opts=('-Ddocumentation=true'

	       # networking
	       '-Dtcp=false'
	       '-Dlocal_socket=false'
	       '-Dipv6=disabled'

	       # audio formats
	       '-Ddsd=false'

	       # database
	       '-Dupnp=disabled'
	       '-Ddatabase=false'
	       '-Dlibmpdclient=disabled'

	       # neighbor
	       '-Dneighbor=false'

	       # storage
	       '-Dudisks=disabled'
	       '-Dwebdav=disabled'

	       # playlist
	       '-Dcue=false'

	       # input
	       '-Dsmbclient=disabled'
	       '-Dnfs=disabled'
	       '-Dcdio_paranoia=disabled'
	       '-Dcurl=disabled'
	       '-Dmms=disabled'

	       # cloud
	       '-Dqobuz=disabled'
	       '-Dtidal=disabled'
	       '-Dsoundcloud=disabled'

	       # archive
	       '-Dzzip=disabled'
	       '-Dbzip2=disabled'
	       '-Diso9660=disabled'

	       # tags
	       '-Dchromaprint=disabled' # appears not to be used for anything
	       '-Did3tag=disabled'

	       # decoders
	       '-Dadplug=disabled' # not in an official repo
	       '-Dmodplug=disabled'
	       '-Dsidplay=disabled' # unclear why but disabled in the past
	       '-Dwavpack=disabled'
	       '-Dffmpeg=disabled'
	       '-Daudiofile=disabled'
	       '-Dfaad=disabled'
	       '-Dflac=disabled'
	       '-Dfluidsynth=disabled'
	       '-Dgme=disabled'
	       '-Dmad=disabled'
	       '-Dmikmod=disabled'
	       '-Dmpcdec=disabled'
	       '-Dmpg123=disabled'
	       '-Dopus=disabled'
	       '-Dsndfile=disabled'
	       '-Dtremor=disabled'
	       '-Dvorbis=disabled'
	       '-Dwildmidi=disabled'

	       # encoders
	       '-Dwave_encoder=false'
	       '-Dvorbisenc=disabled'
	       '-Dlame=disabled'
	       '-Dtwolame=disabled'
	       '-Dshine=disabled' # not in an official repo

	       # filters
	       '-Dlibsamplerate=disabled'
	       '-Dsoxr=disabled'

	       # output
	       '-Dfifo=false'
	       '-Dhttpd=false'
	       '-Drecorder=false'
	       '-Doss=disabled'
	       '-Dalsa=disabled'
	       '-Dopenal=disabled'
	       '-Dpulse=disabled'
	       '-Dshout=disabled'
	       '-Dao=disabled'
	       '-Djack=disabled'
	       '-Dpipe=false'
	       '-Dsndio=disabled' # interferes with detection of alsa devices

	       # misc
	       '-Dyajl=disabled'
	       '-Ddbus=disabled'
	       '-Dsqlite=disabled'
	       '-Dexpat=disabled'
	       '-Dicu=disabled'
	       '-Diconv=disabled'
	       '-Dpcre=disabled'
	       '-Dzlib=disabled'

	       '-Dzeroconf=disabled'
	)
	arch-meson --auto-features auto  .. ${_opts[@]}
	ninja
}

package() {
	cd "${srcdir}/mpd-${pkgver}/build"
	
	DESTDIR="${pkgdir}" ninja install
	install -Dm644 ../doc/mpdconf.example "${pkgdir}"/usr/share/doc/mpd/mpdconf.example
	install -Dm644 ../doc/mpd.conf.5 "${pkgdir}"/usr/share/man/man5/mpd.conf.5
	install -Dm644 ../doc/mpd.1 "${pkgdir}"/usr/share/man/man1/mpd.1

	install -Dm644 "${srcdir}"/mpd.conf "${pkgdir}"/etc/mpd.conf
	install -Dm644 "${srcdir}"/mpd.tmpfile "${pkgdir}"/usr/lib/tmpfiles.d/mpd.conf
	install -d -g 45 -o 45 "${pkgdir}"/var/lib/mpd{,/playlists}

	# Now service file installs only when libsystemd package was found
	if [ -e "${pkgdir}"/usr/lib/systemd/system/mpd.service ]; then 
		sed \
			-e '/\[Service\]/a User=mpd' \
			-e '/WantedBy=/c WantedBy=default.target' \
			-i "${pkgdir}"/usr/lib/systemd/system/mpd.service
	fi
}
