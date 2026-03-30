# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Callum Parsey <callum@neoninteger.au>
# Contributor: Laszlo Papp <lpapp@kde.org>

# TODO: The package is called `adduser-deb` for historical reasons. Merging it
# into `adduser-debian` would simplify the logic involved in pulling and
# extracting the upstream archives, but would require adding `replaces` and
# `conflicts` directives. Neither scenario is ideal, so just use the old name.
pkgname=adduser-deb
_pkgname=adduser-debian
pkgver=3.155
pkgrel=1
pkgdesc="Debian's 'adduser' and 'deluser' commands for creating and removing users"
arch=("any")
url="https://salsa.debian.org/debian/adduser"
license=("GPL-2.0-or-later")

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
makedepends=("dpkg" "po4a")

conflicts=("adduser")
backup=("etc/adduser.conf" "etc/deluser.conf")
source=("https://salsa.debian.org/debian/adduser/-/archive/debian/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "arch-license-path.patch"
        "arch-policy.patch")
sha256sums=('6ada7f113ff0c43efcf621c07fe22a7b2de9023cd735d738c66562430854ce9c'
            'fa6590b6d8d6dfab1b4da3230115c3d69fd70c7dea84e5308369819c0a5734f4'
            '0298fd67a2b313f44d83024c737fbf0408871c29e28324223abe8d3269391ec9')

prepare() {
  cd ${_pkgname}-${pkgver}

  # Arch's UID/GID policy differs a little from Debian's. I've included a patch
  # which issues the necessary changes to both the template configuration files
  # as well as the scripts themselves. These changes include the following:
  # * Automatically chosen system user/group IDs start at 500 instead of 100
  # * Automatically chosen regular user/group IDs end at 60000 instead of 59999
  # * The regex defining which user names are allowed has been changed to
  #   `^[a-zA-Z0-9_][a-zA-Z0-9_-]*\$?$` to match the Arch policy of "only lower
  #   and upper case letters, digits, underscores, or dashes" and "can end with
  #   a dollar sign". All other conditions seem to be covered by additional
  #   checks in `adduser` which cannot be customised by the user.
  # * Arch does not automatically add non-system users to the `users` group
  # Sources: useradd(8) and /etc/login.defs
  # TODO: The translated manpages also need to be updated with the new default
  # options. I've neglected this for now because all of the translations for
  # adduser.conf(5) are currently rejected by `po4a` for being incomplete.
  patch -Np1 -d . -i ../arch-policy.patch

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
  patch -Np1 -d . -i ../arch-license-path.patch
  sed -i "s/my \$version = \"DVERSION\"/my \$version = \"${pkgver}-arch${pkgrel}\"/" {add,del}user
}

# Translated manpages have to be generated using `po4a`.
build() {
  # Manpages
  cd ${_pkgname}-${pkgver}/doc/po4a
  po4a --keep 60 --previous po4a.conf
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

  # Binaries and helper scripts
  install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/share/perl5/vendor_perl/Debian"
  install -m755 {add,del}user "${pkgdir}/usr/bin"
  install -m755 Adduser{Common,CreateHomedir,Logging,Retvalues,Statefile}.pm \
          "${pkgdir}/usr/share/perl5/vendor_perl/Debian"
  ln -s adduser "${pkgdir}/usr/bin/addgroup"
  ln -s deluser "${pkgdir}/usr/bin/delgroup"

  # Configuration files
  install -d "${pkgdir}/etc"
  install -m644 {add,del}user.conf "${pkgdir}/etc"

  # Documentation
  cd debian
  install -d "${pkgdir}/usr/share/doc/adduser"
  install -m644 copyright NEWS README "${pkgdir}/usr/share/doc/adduser"

  # Manpages
  # This is more than a mouthful, so let's work through it step-by-step.
  # 1. Get a list of all of the available `*.po` files in the `doc/po4a/po`
  #    directory and store the list in `$all_languages`
  # 2. Remove all of the `.po` extensions from the list. This causes
  #    `$all_languages` to contain just a list of allowed language codes.
  # 3. Start scanning all of the files beginning with `adduser` and `deluser`.
  # 4. If the current file name begins with `adduser.local` then we skip it and
  #    return to step 3. This is because we don't install the `adduser.local`
  #    script in this package (if present, it requires manual configuration
  #    before `adduser` is safe to run) so we also don't want its manpages.
  # 5. Extract the language code from the file name, if it exists. We do this
  #    using a regex match.
  #    5.1. The `$all_languages` variable has its spaces replaced with bar
  #         characters. This means that the file name is matched against a
  #         regex which looks like the following: \.(<lang>|<lang>|<lang>)\.
  #         This matches a literal dot, followed by any one of the valid
  #         language codes, followed by another dot. We match with the dots so
  #         that we don't accidentally match other portions of the file name.
  #    5.2. If a match was found, then the `BASH_REMATCH[0]` variable will
  #         contain the matching string, which is the file's language code
  #         surrounded by dots. We remove the dots and store the found language
  #         code in the `$language` variable.
  #    Note that if the regex didn't match, then the `$language` variable will
  #    be empty to indicate that there is no language code for this file.
  # 6. Use the information we now have to generate the destination path for the
  #    current file and use `install` to put the file there.
  #    6.1. If the language code existed, then the first part of the path will
  #         expand as `/usr/share/man/<lang>/`. If there was no language code,
  #         then the path will expand as `/usr/share/man/./` which is the same
  #         as just `/usr/share/man/`. This matches the Arch policy where
  #         non-English manpages are in dedicated language subdirectories, but
  #         English manpages are not.
  #    6.2. We figure out which section the manual should go into, by removing
  #         all but the last character from the file name (which is a number,
  #         either 5 or 8 as of this writing). For example, if the file name
  #         was `adduser.conf.5` then it would go into the `man5` subdirectory.
  #    6.3. Finally, if the file name contained a language code, we need to
  #         remove it. If the language code existed, then Bash would match and
  #         remove the language code as well as its preceding dot (i.e.
  #         `adduser.conf.fr.5` would become `adduser.conf.5`). If the language
  #         code did not exist, then Bash would attempt to match two
  #         consecutive dot characters (`..`) which does not occur in our
  #         dataset, so no removal occurs.
  # 7. Return to step 3 with the next file in the list
  #
  # The overall result of this is that we get the desired path translations:
  # * adduser.conf.5 goes directly to /usr/share/man/man5/adduser.conf.5
  # * adduser.conf.fr.5 goes to /usr/share/man/fr/man5/adduser.conf.5
  cd ../doc
  local all_languages=$(cd po4a/po; echo *.po)
  all_languages=${all_languages//.po}
  for file in adduser* deluser*; do
    [[ $file =~ adduser\.local ]] && continue
    local language=$([[ $file =~ \.(${all_languages// /|})\. ]] && echo ${BASH_REMATCH[0]:1:-1})
    install -Dm644 $file "${pkgdir}/usr/share/man/${language:-.}/man${file: -1:1}/${file//.${language:-.}}"
  done
}
