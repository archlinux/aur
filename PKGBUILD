# Maintainer: Phillip Smith <pkgbuild@phs.id.au>
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
pkgver=3.3.7p1
pkgrel=1
pkgdesc="Advanced Maryland Automatic Network Disk Archiver"
url="http://www.amanda.org"
arch=('i686' 'x86_64')
license=('custom')
depends=('perl>=5.6.0' 'glib2>=2.2.0' 'gawk' 'gnuplot' 'tar>=1.12' 'xinetd')
optdepends=(
  'dump: for creating backups in dump format'
  'samba: for backing up Windows hosts'
  )
install="$pkgname.install"
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz" "xinetd.${pkgname}")
md5sums=('621d39b5a328f465fece4653c170cf7f'
         '910c9823073148c576b14d4a71bc6458')

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

_testAmandaUserGroup() {
  if ! getent group $_amandagroup > /dev/null ; then
    error "The amanda group must exist prior to building."
    error "Suggested command: groupadd -g $_amandagid $_amandagroup"
    return 1
  fi
  if ! getent passwd $_amandauser > /dev/null ; then
    error "The amanda user must exist prior to building."
    error "Suggested command: useradd --system -u $_amandauid -g $_amandagroup -G storage,disk -m -d /var/amanda -s /bin/bash -c 'Amanda Backup Daemon' $_amandauser"
    return 2
  fi
}

build() {
  # upstream sources require amanda user and group exist at build time
  _testAmandaUserGroup

  cd "$srcdir"/$pkgname-$pkgver

	./configure --prefix=/usr \
    --sbindir=/usr/bin \
    --with-configdir=/etc/amanda \
    --with-gnutar-listdir=/var/amanda/gnutar-lists \
    --mandir=/usr/share/man \
		--with-user=$_amandauser \
    --with-group=$_amandagroup \
    --with-ipv6 \
    --with-ssh-security

	make
}

package() {
  # upstream sources require amanda user and group exist at build time
  _testAmandaUserGroup
  
  cd "$srcdir"/$pkgname-$pkgver
  
  # Install the compiled output
  make DESTDIR="$pkgdir" install
  
  # symlink example directory
  install -d -o root -g root -m 0750 "$pkgdir"/etc/$pkgname/
  ln -sf /usr/share/amanda/example/ "$pkgdir"/etc/$pkgname/example
  
  # Install xinetd configuration
  install -D -o root -g root -m 0755 "$srcdir"/xinetd.$pkgname "$pkgdir"/etc/xinetd.d/$pkgname
  
  # Create some files
  install -d -o $_amandauser -g $_devgroup -m 0700 "$pkgdir"/var/$pkgname/

  install -D -o $_amandauser -g $_devgroup -m 0600 /dev/null "$pkgdir"/$_amandahosts
  cat > "$pkgdir"/var/$pkgname/.amandahosts << EOT
# This is where amanda works out what remote connections to allow in the format
# of <host> <username> <command>
#
# server1.example.com   amanda  amdump
EOT

  # create some of the runtime files amanda requires so they are created with
  # the correct ownership and permissions.
  install -D -o $_amandauser -g $_devgroup -m 0664 /dev/null "$pkgdir"/$_amandadates
  install -D -o $_amandauser -g $_devgroup -m 0664 /dev/null "$pkgdir"/$_amandadumpdates
  install -d -o $_amandauser -g $_devgroup -m755 "$pkgdir"/$_amandagnutarlists

  # Fix permissions
  chown -R $_amandauser:$_devgroup "$pkgdir"/etc/$pkgname/
  
  # Install the licence
  install -Dm444 COPYRIGHT "$pkgdir"/usr/share/licences/$pkgname/COPYRIGHT
}

# vim:set ts=2 sw=2 et:
