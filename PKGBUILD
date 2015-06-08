# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=amanda
pkgver=3.3.5
pkgrel=1
pkgdesc="Advanced Maryland Automatic Network Disk Archiver"
arch=('i686' 'x86_64')
license=('custom')
depends=('perl>=5.6.0' 'glib2>=2.2.0' 'gawk' 'gnuplot' 'tar>=1.12' 'xinetd')
optdepends=('dump: for creating backups in dump format' 'samba: for backing up Windows hosts')
install="$pkgname.install"
url="http://www.amanda.org"
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz" "xinetd.${pkgname}")
md5sums=('fd545874dff334c424337ca9d7683ff6'
         '910c9823073148c576b14d4a71bc6458')

# yes, this pkgbuild is very non-standard and quite a hack, but the upstream
# devs insist that we need to have an amanda user/group BEFORE the package is
# built for some annoying reasons. this is why we have to makepkg as root if
# the 'amanda' user and group don't already exist. if anyone has any better
# ideas how to do this, I'm happy to accept patches (via github pull request)

# if you want to run amanda as a different user and/or group, change these
# variables before running makepkg
_amandauser='amanda'
_amandagroup='amanda'
_amandauid=112
_amandagid=112

_devgroup='disk'
_amandahosts='var/amanda/.amandahosts'
_amandadates='var/amanda/amandates'
_amandadumpdates='var/amanda/dumpdates'
_amandagnutarlists='var/amanda/gnutar-lists'

build() {
  # the amanda user and group are required to build
  if [ -z "$(getent passwd $_amandauser)" ] ; then
    msg "Adding user/group (temporarily)"
    groupadd -g $_amandagid $_amandagroup
    useradd -u $_amandauid -g $_amandagroup -G storage,disk -m -d /var/amanda -s /bin/bash -c "Amanda Backup Daemon" $_amandauser
    _cleanup=1
  else
    _cleanup=0
  fi
  
  cd $srcdir/$pkgname-$pkgver
  
	./configure --prefix=/usr \
    --with-configdir=/etc/amanda \
    --with-gnutar-listdir=/var/amanda/gnutar-lists \
    --mandir=/usr/share/man \
		--with-user=$_amandauser \
    --with-group=$_amandagroup \
    --with-ipv6 \
    --with-ssh-security \
    --htmldir=/srv/http/docs/$pkgname

	make
	
  if [ $_cleanup -eq 1 ]; then
    msg "Removing temporary user/group"
    userdel -r $_amandauser
  fi
}

package() {
  # the amanda user and group are required to package
  if [ -z `getent passwd amanda` ]; then
    msg "Adding user/group amanda (temporarily)"
    groupadd -g $_amandagid $_amandagroup
    useradd -u $_amandauid -g $_amandagroup -G storage,disk -m -d /var/amanda -s /bin/bash -c "Amanda Backup Daemon" $_amandauser
    _cleanup=1
  else
    _cleanup=0
  fi
  
  cd $srcdir/$pkgname-$pkgver
  
  # Install the compiled output
  make DESTDIR=$pkgdir install
  
  # Install configuration examples
  install -dm755 $pkgdir/etc/$pkgname/
  cp -r example $pkgdir/etc/$pkgname/
  
  # Install xinetd configuration
  install -dm755 $pkgdir/etc/xinetd.d/
  cp $srcdir/xinetd.$pkgname $pkgdir/etc/xinetd.d/$pkgname
  
  # Create some files
  install -dm755 $pkgdir/var/$pkgname/
  chmod 700 $pkgdir/var/$pkgname/
  chown -R $_amandauser:$_devgroup $pkgdir/var/$pkgname

  touch $pkgdir/$_amandahosts
  chown $_amandauser:$_devgroup $pkgdir/$_amandahosts
  chmod 600 $pkgdir/$_amandahosts
  cat > $pkgdir/var/$pkgname/.amandahosts << EOT
# This is where amanda works out what remote connections to allow in the format
# of <host> <username> <command>
#
# server1.example.com   amanda  amdump
EOT
  
  touch $pkgdir/$_amandadates
  chown $_amandauser:$_devgroup $pkgdir/$_amandadates
  
  touch $pkgdir/$_amandadumpdates
  chown $_amandauser:$_devgroup $pkgdir/$_amandadumpdates
  chmod 664 $pkgdir/$_amandadumpdates

  install -dm755 $pkgdir/$_amandagnutarlists
  chown -R $_amandauser:$_devgroup $pkgdir/$_amandagnutarlists

  # Fix permissions
  chown -R $_amandauser:$_devgroup $pkgdir/etc/$pkgname/
  
  # Install the licence
  install -Dm444 COPYRIGHT $pkgdir/usr/share/licences/$pkgname/COPYRIGHT

  # Cleanup
  rm -Rf $pkgdir/usr/share/amanda/example/
  if [ $_cleanup -eq 1 ]; then
    msg "Removing temporary user/group"
    userdel -r $_amandauser
  fi
}

# vim:set ts=2 sw=2 et:
