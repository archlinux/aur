# Maintainer: Swift Geek <swifgeek ɐ google m č0m>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>
# Contributor: olasd
#TODO: sed-out "need" for ExtUtils::Typemap or provide package if really needed
#TODO: integrate with makepkg.d/

pkgname=slic3r-git
pkgver=0
pkgrel=12
pkgdesc="Slic3r is an STL-to-GCODE translator for RepRap 3D printers, aiming to be a modern and fast alternative to Skeinforge."
arch=('any')
url="http://slic3r.org/"
license=('GPL')
depends=('perl'
         'perl-moo' 'perl-boost-geometry-utils' 'perl-math-clipper' 'perl-math-convexhull' 'perl-math-geometry-voronoi' 'perl-math-planepath' 'perl-math-convexhull-monotonechain' 'perl-io-stringy' 'perl-encode-locale' 'perl-extutils-makemaker-aur>=6.82' 'perl-extutils-parsexs>=3.22' )
makedepends=('git')
optdepends=('perl-wx: GUI support'
            'perl-net-dbus: notifications support via any dbus-based notifier'
            'perl-xml-sax-expatxs: make AMF parsing faster'
            'perl-xml-sax: Additive Manufacturing File Format (AMF) support'
            'perl-wx-glcanvas: support for opengl preview' 
            'perl-opengl: support for opengl preview'
            'perl-class-xsaccessor: creating faster accessor methods')
#             'perl-growl-gntp: notifications support via growl'
provides=('slic3r' 'slic3r-xs' 'slic3r-xs-git')
conflicts=('slic3r' 'slic3r-xs' 'slic3r-xs-git')
#Consider uncommenting line below in case of false negative test results ;)
#BUILDENV+=('!check')
source=('git+https://github.com/alexrj/Slic3r.git' 'slic3r.desktop' 'slic3r.pl')
md5sums=('SKIP'
         '1b561afff48c79f86889664375d179ed'
         '1371d698799ee97a43d22f6436a2e619')

_gitname="Slic3r"

countdown() {
  local i 
  for ((i=$1; i>=1; i--)); do
    [[ ! -e /proc/$$ ]] && exit
    echo -ne "\rPress [i] to start interactive config in $i second(s) or any key to skip "
    sleep 1
  done
}

prepare() {
  export _src_dir="$srcdir/$_gitname"
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  export SLIC3R_NO_AUTO="true"

# TODO: After all done ramp up pkgver++
# TODO: Remind user about stable branch and others
# TODO: ASK for disabling checks
#------------------------------------------------------
# Welcome new interactive config overlord
  tty -s && {
    countdown 3 & countdown_pid=$!
    read -s -n 1 -t 3 ikey || true
    kill -s SIGHUP $countdown_pid > /dev/null || true # Any key below 1sec fix
    echo -e -n "\n"
  }
  if [ "$ikey" = "i" -o "$ikey" = "I" ]; then
    select_mode=$(dialog --clear --backtitle "$pkgname" --noitem --radiolist 'Specify revision based on:' 0 0 0 branch/commit on tag off  2>&1 >/dev/tty)
    case $select_mode in
      "branch/commit")
        cd "$_src_dir"
        # Pick a branch - default is master… for now
        branches=( $(git ls-remote --heads origin  | sed 's?.*refs/heads/??' | awk '{printf $1; if ($1 == "master") printf " on ";else printf " off "}') )
        branch=$(dialog --clear --backtitle "$pkgname" --no-items --radiolist 'Pick branch' 0 0 0 ${branches[*]} 2>&1 >/dev/tty)
        unset branches
        msg2 "Chosen \"${branch}\" branch "
        git checkout $branch -f
        # Pick commit
        readarray -t git_log <<< "$(git --no-pager log -n 30 --pretty=oneline)"
        for line in "${git_log[@]}"
        do
          commits+=( "$(echo $line | awk '{printf $1}')" )
          commits+=( "$(echo $line | awk '{for (i=2; i<=NF; i++) { printf $i; if (i<NF) printf " " } }')" )
          commits+=( 'off' )
        done
        unset git_log
        commits[2]='on'
        commit=$(dialog --clear --backtitle "$pkgname" --radiolist 'Pick commit' 0 0 0 "${commits[@]}" 2>&1 >/dev/tty)
        unset commits
        msg2 "Picked \"${commit}\" commit"
        git checkout  $commit -f
        ;;
      "tag")
        cd "$_src_dir"
        tags=( $(git tag -l | tac | awk '{printf $1; if ($1 == "1.0.0RC1") printf " on ";else printf " off "}') )
        tag=$(dialog --clear --backtitle "$pkgname" --no-items --radiolist 'Pick tag' 0 0 0 ${tags[*]} 2>&1 >/dev/tty)
        git checkout "tags/${tag}" -f
        ;;
      *)
        echo "WTF!? This shouldn't happen at all"
        ;;
    esac
  fi

  cd "$_src_dir"
  # Nasty fix for useless Growl dependency ... please post in comment real fix, if u know one ;) TODO: Change it to just line containing just like in netfabb
#  sed -i "s/        'Growl/\#&/" Build.PL
  sed -i '/Growl/d' Build.PL

  # Nasty fix for useless warning
  sed -i '/^warn \"Running Slic3r under Perl/,+1 s/^/\#/' ./lib/Slic3r.pm

  # Why true? cuz pacman is crazy... and it still doesn't work as intended
  true && pkgver="$(awk 'BEGIN{FS="\""}/VERSION/{gsub(/-dev/,"",$2); print $2 }' ./lib/Slic3r.pm).$(git rev-parse --short HEAD)"
  export _pkgver="$pkgver"
  msg2 "Fetched $_pkgver"
}

build() {
  cd "$_src_dir/xs"
  warning " ⚠  DO NOT respond to any question with 'yes'. Report a bug in comment instead.\n"
  warning "Running Slic3r under Perl >= 5.16 is not supported nor recommended\nIn case of related to this issues please use ARM repository to get older perl package\n"
  # Cuz cpan will install fixes to $HOME ... which is not the point of this package

  # slic3r-xs Build stage
  msg2 "Building Slic3r::XS (1/3)"
  /usr/bin/perl Build.PL
  ./Build

}

check () {
  cd "$_src_dir"

  msg2 "Testing Slic3r::XS - (2/3)"
  prove -Ixs/blib/arch -Ixs/blib/lib/ xs/t/

  msg2 "Testing Slic3r (3/3)"
  prove -Ixs/blib/arch -Ixs/blib/lib/ t/
}

package () {
  cd "$_src_dir"
  install -d $pkgdir/usr/share/perl5/vendor_perl/
  cp -R $srcdir/$_gitname/lib/* $pkgdir/usr/share/perl5/vendor_perl/

  install -d $pkgdir/usr/bin/vendor_perl/
  install -m 755 $srcdir/$_gitname/slic3r.pl $pkgdir/usr/bin/vendor_perl/

  #TODO : Do something about utils !
  #install -m 755 $srcdir/$_gitname/utils/*.pl $pkgdir/usr/bin/
  #install -m 755 $srcdir/$_gitname/utils/post-processing/*.pl $pkgdir/usr/bin/

  # ZSH autocompletion
  install -d "${pkgdir}/usr/share/zsh/site-functions"
  install -m 0644 "$srcdir/$_gitname/utils/zsh/functions/_slic3r" "$pkgdir/usr/share/zsh/site-functions/_slic3r.zsh"

  # Icons " current Build.PL is not really geared for installation "
  install -d $pkgdir/usr/bin/vendor_perl/var
  install -m 644 $srcdir/$_gitname/var/*  $pkgdir/usr/bin/vendor_perl/var/

  # Desktop icon
  install -d $pkgdir/usr/share/applications
  install -m 644 $srcdir/slic3r.desktop $pkgdir/usr/share/applications/

  # Welcome ultimate ugly - u² hack TODO: This may be not needed anymore!
  install -m 755 $srcdir/slic3r.pl $pkgdir/usr/bin/slic3r.pl

  ### SLIC3R-XS MERGE
  cd "$_src_dir/xs"
  ./Build install

  # Why double? 1st one was just for messages, this one is for real
  true && pkgver=$_pkgver
}

