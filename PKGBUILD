# Maintainer: Callum Parsey <callum@neoninteger.au>
# Contributor: Laszlo Papp <lpapp@kde.org>

# TODO: The package is called `adduser-deb` for historical reasons. Merging it
# into `adduser-debian` would simplify the logic involved in pulling and
# extracting the upstream archives, but would require adding `replaces` and
# `conflicts` directives. Neither scenario is ideal, so just use the old name.
pkgname=adduser-deb
_pkgname=adduser-debian
pkgver=3.131
pkgrel=1
pkgdesc="Debian's 'adduser' and 'deluser' commands for creating and removing users"
arch=("any")
url="https://salsa.debian.org/debian/adduser"
license=("GPL2")

# findutils: provides the `find` back-end command used during traversal of the
#            skeleton user directory
# perl: provides the `perl` interpreter and standard libraries needed to
#       actually run the `adduser` and `deluser` scripts
# shadow: provides the back-end commands `useradd`, `usermod`, `groupadd` and
#         `gpasswd` used throughout the script
# util-linux: provides the `chfn` back-end command as well as the `nologin`
#             dummy shell for disabling login for users
# perl-locale-gettext: not required for the script to run, but if installed,
#                      you'll get localised/translated output based on your
#                      system locale
# quota-tools: provides the `edquota` back-end tool which is only needed if
#              the `QUOTAUSER` config option is used - see adduser.conf(5)
# tar: provides the `tar` back-end tool which is only needed if any of the
#      `BACKUP*` options are used or if passing any of the `--backup*`
#      arguments to `deluser` - see deluser(8) and deluser.conf(5)
# po4a: used during the packaging process to generate translated manpages
depends=("findutils" "perl" "shadow" "util-linux")
optdepends=("perl-locale-gettext: needed for localised/non-English output"
            "quota-tools: needed if enabling the \`QUOTAUSER\` option in \`adduser.conf\`"
            "tar: needed for \`deluser --backup\` or if enabling the \`BACKUP*\` options in \`deluser.conf\`")
makedepends=("po4a")

conflicts=("adduser")
backup=("etc/adduser.conf" "etc/deluser.conf")
source=("https://salsa.debian.org/debian/adduser/-/archive/debian/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "arch-license-path.patch"
        "arch-policy.patch")
sha256sums=('3ce6de32bce048d12429d9431b36d8437c1934266475b6a9f5235b3dff54f918'
            '2bb01846f0f3206796a817aacc65bef7d216ef7e0a89132661abb4182f0ba7d6'
            '245e1fcd5baa0e85471ef92778bd429dedc094e02743d1a832217e116be3ccb1')

prepare() {
  # Arch's UID/GID policy differs a little from Debian's. I've included a patch
  # which issues the necessary changes to both the template configuration files
  # as well as the scripts themselves. These changes include the following:
  # * Automatically chosen system user/group IDs start at 500 instead of 100
  # * Automatically chosen regular user/group IDs end at 60000 instead of 59999
  # * The regex defining which user names are allowed has been changed to
  #   `^[a-zA-Z0-9_][-a-zA-Z0-9_]*\$?$` to match the Arch policy of "only lower
  #   and upper case letters, digits, underscores, or dashes" and "can end with
  #   a dollar sign". All other conditions seem to be covered by additional
  #   checks in `adduser` which cannot be customised by the user.
  # * Arch does not automatically add non-system users to the `users` group
  # Sources: useradd(8) and /etc/login.defs
  # TODO: The translated manpages also need to be updated with the new default
  # options. I've neglected this for now because all of the translations for
  # adduser.conf(5) are currently rejected by `po4a` for being incomplete.
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

# TODO: Automatic testing. This is difficult for four reasons:
# * It is not safe to run the tests on a real system, because a large number of
#   user accounts will be created and removed during the test runs, possibly
#   conflicting with real users. The tests should only be run in a user
#   namespace with it's own root filesystem, e.g. by using `makechrootpkg`
#   instead of `makepkg` or an AUR helper. Thus, we would need a way to prevent
#   the tests from being run automatically unless the user has signalled that
#   they understand this. This could be done, for example, by requiring them to
#   set an environment variable before running `makechrootpkg`.
# * The tests require the package to have been installed (i.e. the config files
#   have to be in /etc and the binaries in /usr/bin). I'll either have to work
#   around that within the PKGBUILD somehow, or patch the tests to use files
#   from the `$srcdir` directory.
# * The main test runner script attempts to run the test suite twice - once
#   with shadow passwords enabled, and once without. Arch does not seem to
#   support disabling shadow passwords, so the script will need to be patched
#   to avoid testing that.
# * The basic Arch root created using `mkarchroot` is missing the `users` and
#   `nogroup` groups which are required for most of the tests. So I would have
#   to create them manually (on a real system, `systemd-sysusers` would create
#   the `users` group automatically, but not `nogroup`)

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
