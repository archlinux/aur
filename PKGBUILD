# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Michael Healy <horsemanoffaith@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: thn81 <root@scrat>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname%-*}, repo=xenial
# vercheck-archlinux: name=${pkgname%-*}, repo=extra, arch=x86_64
# vercheck-gnome: name=${pkgname%-*}, majorver=3.24
# vercheck-ppa: name=${pkgname%-*}, url=ppa:gnome3-team/gnome3-staging

pkgname=gnome-settings-daemon-elementary
_use_ppa=false
_ppa_rel=0ubuntu0~bionic1
_ppa_ver=3.27.91
_ubuntu_rel=0ubuntu1
_ubuntu_ver=3.28.0
if [[ "${_use_ppa}" == "true" ]]; then
    _commit=08c416c68f7becc75ea43723fc956436d4976e79 # tags/GNOME_SETTINGS_DAEMON_3_27_91^0
else
    _commit=5ac1a8240fb784cc92e2b394156153e34e21dab9 # tags/GNOME_SETTINGS_DAEMON_3_28_0^0
fi
pkgver=3.28.0
pkgrel=3
pkgdesc="GNOME Settings Daemon (with elementary OS patch)"
url="https://gitlab.gnome.org/GNOME/gnome-settings-daemon"
arch=(i686 x86_64)
license=(GPL)
depends=(dconf geoclue2 geocode-glib gnome-desktop 'gsettings-desktop-schemas-ubuntu>=3.24.0'
	gtk3-print-backends libcanberra-pulse libgudev libgweather libnotify librsvg 
	libsystemd libwacom nss pulseaudio pulseaudio-alsa upower)
makedepends=(docbook-xsl git gnome-common intltool libxslt python xf86-input-wacom meson)
groups=(gnome unity pantheon-qq)
provides=(gnome-settings-daemon{,-ubuntu}="${pkgver}")
conflicts=(gnome-settings-daemon{,-ubuntu})
source=("git+https://gitlab.gnome.org/GNOME/gnome-settings-daemon.git/#commit=${_commit}"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git/"
        'manage-dpms.patch')

if [[ "${_use_ppa}" == "true" ]]; then
    source+=("http://ppa.launchpad.net/gnome3-team/gnome3-staging/ubuntu/pool/main/g/gnome-settings-daemon/gnome-settings-daemon_${_ppa_ver:-${pkgver}}-${_ppa_rel}.debian.tar.xz")
else
    source+=("https://launchpad.net/ubuntu/+archive/primary/+files/gnome-settings-daemon_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz")
fi

sha512sums=('SKIP'
            'SKIP'
            '08b95b9892ed004c3da1506e272ea895885c47d70632f26edd8e5101bcb5936494b6419f4ea8a56f18964e89918401603188fd1f376795b42b2a1c7107706f2a')
if [[ "${_use_ppa}" == "true" ]]; then
    sha512sums+=('9203c13a2b8526dec82e838e46c62919cd2dd38224a8aca942bc3821cc662cee2dcc459241f363f047475dc7c4800616078201eb1a5e1e4ac6d003a0f3231fe3')
else
    sha512sums+=('fdbeef6092a78e56cfa939abc1f107c0ff3aa496e7a0bd8b0b80eb3c5d39f364cbdb145b146f29b9ce5d4e5e4c80c045751e1950932399020ff64fda35560f8c')
fi

pkgver() {
    cd "${pkgname%-*}"
    git describe --tags | sed 's/^GNOME_SETTINGS_DAEMON_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd "${pkgname%-*}"

    git submodule init
    git config --local submodule."subprojects/gvc".url "${srcdir}/libgnome-volume-control"
    git submodule update

  # Apply Ubuntu's patches
  for i in $(grep -v '#' "$srcdir/debian/patches/series"); do
    [[ "${i}" =~ ^# || -z "${i}" || "${i}" == *git* ]] && continue # Skip comments, newlines, and git patches
    [[ "${i}" == 53_sync_input_sources_to_accountsservice.patch ]] && continue #Cannot build with this patch; don't ask me how Canonical makes it work
    msg2 "Applying $i ..."
    patch -Np1 < "$srcdir/debian/patches/$i"
  done

  # Apply Elementary's patches
  msg2 "Applying manage-dpms.patch ..."
  patch -Np0 < ../manage-dpms.patch
}

build() {
    cd "${pkgname%-*}"

    meson \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --libexecdir=/usr/lib/gnome-settings-daemon \
        -Dstatic-false=true \
        builddir

    ninja -C builddir

    #"-Dstatic-false=true"
    #According to the GNOME initiative the format should be -Dstatic-false
    #meson says it needs to be followed by =bool
    #Rediculous, utterly rediculous and probably wrong.
}

package() {
    cd "${pkgname%-*}"

    DESTDIR="${pkgdir}" ninja -C builddir install
    # Elementary is shipping these with pantheon-session-git; not sure how good an idea that is (upstream gsd could change before they can react)
    #cd "${pkgdir}"
    #for i in $(grep -Rl OnlyShowIn etc/xdg/autostart/); do
    #  cp "${i%.*}"{,-pantheon}.desktop
    #  sed -i 's|OnlyShowIn=GNOME;|OnlyShowIn=Pantheon;|g' "${i%.*}"-pantheon.desktop
    #done

}
