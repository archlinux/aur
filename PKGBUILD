# Maintainer: Callum Parsey <callum@neoninteger.au>
# Contributor: Laszlo Papp <lpapp@kde.org>

# TODO: The package is called `adduser-deb` for historical reasons. Merging it
# into `adduser-debian` would simplify the logic involved in pulling and
# extracting the upstream archives, but would require adding `replaces` and
# `conflicts` directives. Neither is ideal.
pkgname=adduser-deb
_pkgname=adduser-debian
pkgver=3.131
pkgrel=1
pkgdesc="Debian's 'adduser' and 'deluser' commands for creating and removing users"
arch=("any")
url="https://salsa.debian.org/debian/adduser"
license=("GPL2")
# TODO: Aren't `shadow` and `perl-locale-gettext` also dependencies?
depends=("gawk")
makedepends=("po4a")
conflicts=("adduser")
backup=("etc/adduser.conf" "etc/deluser.conf")
source=("https://salsa.debian.org/debian/adduser/-/archive/debian/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "arch-license-path.patch"
        "arch-policy.patch")
sha256sums=("3ce6de32bce048d12429d9431b36d8437c1934266475b6a9f5235b3dff54f918"
            "2bb01846f0f3206796a817aacc65bef7d216ef7e0a89132661abb4182f0ba7d6"
            "1cdd9db5dc7b112eb24d2527a08bfbde05fe25f239d36ac03dc0babeb0ba40c4")

prepare() {
  # Arch's UID/GID policy differs a little from Debian's. I've included a patch
  # which issues the necessary changes to both the template configuration files
  # as well as the scripts themselves. These changes include the following:
  # * Automatically chosen system user/group IDs start at 500 instead of 100
  # * Automatically chosen regular user/group IDs end at 60000 instead of 59999
  # Sources: useradd(8) and /etc/login.defs
  # TODO: Patch manpage translations (even though none are complete enough to
  # be part of the package)
  # TODO: Improve user name regex. According to useradd(8) Arch allows
  # uppercase characters, underscores and numbers in the first character (but
  # not dashes) and additionally has an overall character limit of 32
  # characters. None of this is currently checked.
  # TODO: That covers all of the policy differences I've noticed, but there may
  # be more that I didn't notice.
  patch -Np0 -d . -i arch-policy.patch

  # There are two problems with the output of `{add,del}user --version`. The
  # displayed version number is `VERSION` because it is expected that the
  # packager will replace this placeholder with the actual package version
  # number. Additionally, Arch puts the common license files in a different
  # directory, so the path to the GPL2 license file also needs to be adjusted.
  # I prefer using patchfiles, but because the version number comes from here
  # in the PKGBUILD, I have to do that patch using `sed`.
  # TODO: This is actually a very large patch, because I have to change the
  # license path in every translation file. Perhaps collaborating with upstream
  # to make this customisable by the packager would be a good idea.
  patch -Np0 -d . -i arch-license-path.patch
  cd ${_pkgname}-${pkgver}
  sed -i "s/my \$version = \"VERSION\"/my \$version = \"${pkgver}-arch${pkgrel}\"/" adduser deluser
}

# Translated manpages have to be generated using `po4a`. A Makefile is provided
# to prepare the translation files for the scripts.
build() {
  # Manpages
  cd ${_pkgname}-${pkgver}/doc/po4a
  po4a --keep 95 --previous po4a.conf

  # Script string translations
  cd ../../po
  make
}

# TODO: Run tests, but only in isolation from main system
# TODO: What about `adduser.local`? What even is that?
package() {
  cd ${_pkgname}-${pkgver}

  # Binaries
  install -Dm755 adduser "${pkgdir}/usr/bin/adduser"
  install -Dm755 deluser "${pkgdir}/usr/bin/deluser"
  install -Dm755 AdduserCommon.pm "${pkgdir}/usr/share/perl5/vendor_perl/Debian/AdduserCommon.pm"
  ln -s adduser "${pkgdir}/usr/bin/addgroup"
  ln -s deluser "${pkgdir}/usr/bin/delgroup"

  # Configuration files
  install -Dm644 adduser.conf "${pkgdir}/etc/adduser.conf"
  install -Dm644 deluser.conf "${pkgdir}/etc/deluser.conf"

  # Documentation
  cd debian
  install -d "${pkgdir}/usr/share/doc/adduser"
  install -Dm644 copyright NEWS README "${pkgdir}/usr/share/doc/adduser"

  # Manpages
  # TODO: There's probably a way of doing this which is more concise and
  # future-proofed, but probably more complicated.
  # TODO: Some manpage directories on my system are specifically named after
  # their locales. Is this something I should be worried about?
  # TODO: Test in clean chroot with all necessary locales generated
  cd ../doc
  install -Dm644 adduser.8 "${pkgdir}/usr/share/man/man8/adduser.8"
  install -Dm644 adduser.conf.5 "${pkgdir}/usr/share/man/man5/adduser.conf.5"
  install -Dm644 adduser.fr.8 "${pkgdir}/usr/share/man/fr/man8/adduser.8"
  #install -Dm644 adduser.local.8 "${pkgdir}/usr/share/man/man8/adduser.local.8"
  install -Dm644 adduser.nl.8 "${pkgdir}/usr/share/man/nl/man8/adduser.8"
  install -Dm644 adduser.pt.8 "${pkgdir}/usr/share/man/pt/man8/adduser.8"
  install -Dm644 deluser.8 "${pkgdir}/usr/share/man/man8/deluser.8"
  install -Dm644 deluser.conf.5 "${pkgdir}/usr/share/man/man5/deluser.conf.5"
  install -Dm644 deluser.conf.fr.5 "${pkgdir}/usr/share/man/fr/man5/deluser.conf.5"
  install -Dm644 deluser.conf.nl.5 "${pkgdir}/usr/share/man/nl/man5/deluser.conf.5"
  install -Dm644 deluser.conf.pt.5 "${pkgdir}/usr/share/man/pt/man5/deluser.conf.5"
  install -Dm644 deluser.fr.8 "${pkgdir}/usr/share/man/fr/man8/deluser.8"
  install -Dm644 deluser.nl.8 "${pkgdir}/usr/share/man/nl/man8/deluser.8"
  install -Dm644 deluser.pt.8 "${pkgdir}/usr/share/man/pt/man8/deluser.8"

  # Locale/translation files
  cd ../po
  make DESTDIR="${pkgdir}" install
}
