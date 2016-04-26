# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=strongswan-git
pkgver=5.4.1dr1.r24.g278497f
pkgrel=1
pkgdesc='Open source IKEv1/IKEv2 IPSec implementation'
url='http://www.strongswan.org'
license=('GPL')
arch=('i686' 'x86_64')
depends=('libsystemd' 'gmp' 'iproute2')
makedepends=('git' 'gperf' 'unbound' 'pcsclite' 'libmariadbclient' 'libnm-glib')
optdepends=('networkmanager-strongswan: for NetworkManager integration'
            'unbound: unbound plugin (DNSSEC-enabled resolver)'
            'pcsclite: eap-sim-pcsc plugin (EAP-SIM PC/SC smartcard backend)'
            'libmariadbclient: mysql plugin (MySQL database support)'
            'curl: curl plugin (for fetching CRLs via libcurl)'
            'openssl: openssl plugin (libcrypto API backend)'
            'libldap: ldap plugin (for fetching CRLs via LDAP)'
            'pam: xauth plugin (PAM authentication support)'
            'sqlite: sqlite plugin (SQLite3 database support)')
conflicts=(openswan libreswan strongswan ipsec-tools)
provides=(strongswan)
backup=(etc/strongswan{.conf,.d/{charon,charon-logging,pki,pool,scepclient,swanctl{,/swanctl}}.conf})
source=($pkgname::git://git.strongswan.org/strongswan.git strongswan.tmpfiles)
sha256sums=(SKIP 59b410cf04e7ff599a097c8f2f291f4cc836e5cb28ecce98df45a41f61a516d6)

pkgver() {
	cd ${pkgname}
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd ${pkgname}
	./autogen.sh
}

build() {
	__configure_args=(
		### BUILD CONTROL
		#--enable-all                   # enable all plugins and features (they can be with their respective --disable options)
		#--disable-defaults             # disable all default plugins (they can be enabled their respective --enable options)
		#--enable-monolithic            # build monolithic versions of libstrongswan/libcharon with all enabled plugins.
		#--disable-option-checking      # ignore unrecognized --enable/--with options
		--disable-static                # don't build static libraries
		#--enable-silent-rules           # less verbose build output (undo: "make V=1")

		### DIRECTORIES (should not need changing from values set here)
		--prefix=/usr                   # install architecture-independent files in PREFIX [/usr/local]
		--sbindir=/usr/bin              # system admin executables [EPREFIX/sbin]
		--libexecdir=/usr/lib           # program executables [EPREFIX/libexec]
		--sysconfdir=/etc               # read-only single-machine data [PREFIX/etc]
		--sharedstatedir=/var           # modifiable architecture-independent data [PREFIX/com]
		--localstatedir=/var            # modifiable single-machine data [PREFIX/var]

		### DEFAULT FEATURES
		#--disable-aes                  # disable AES software implementation plugin.
		#--disable-attr                 # disable strongswan.conf based configuration plugin.
		#--disable-charon               # disable the IKEv1/IKEv2 keying daemon charon.
		#--disable-cmac                 # disable CMAC crypto implementation plugin.
		#--disable-constraints          # disable advanced X509 constraint checking plugin.
		--disable-des                   # disable DES/3DES software implementation plugin.
		#--disable-dnskey               # disable DNS RR key decoding plugin.
		#--disable-fips-prf             # disable FIPS PRF software implementation plugin.
		#--disable-gmp                  # disable GNU MP (libgmp) based crypto implementation
		#--disable-hmac                 # disable HMAC crypto implementation plugin.
		#--disable-ikev1                # disable IKEv1 protocol support in charon.
		#--disable-ikev2                # disable IKEv2 protocol support in charon.
		#--disable-kernel-netlink       # disable the netlink kernel interface.
		#--disable-load-warning         # disable the charon plugin load option warning in
		#--disable-md5                  # disable MD5 software implementation plugin.
		#--disable-nonce                # disable nonce generation plugin.
		#--disable-pem                  # disable PEM decoding plugin.
		#--disable-pgp                  # disable PGP key decoding plugin.
		#--disable-pkcs1                # disable PKCS1 key decoding plugin.
		#--disable-pkcs12               # disable PKCS12 container support plugin.
		#--disable-pkcs7                # disable PKCS7 container support plugin.
		#--disable-pkcs8                # disable PKCS8 private key decoding plugin.
		#--disable-pki                  # disable pki certificate utility.
		#--disable-pubkey               # disable RAW public key support plugin.
		#--disable-random               # disable RNG implementation on top of /dev/(u)random.
		#--disable-rc2                  # disable RC2 software implementation plugin.
		#--disable-resolve              # disable resolve DNS handler plugin.
		#--disable-revocation           # disable X509 CRL/OCSP revocation check plugin.
		#--disable-scepclient           # disable SCEP client tool.
		#--disable-scripts              # disable additional utilities (found in directory
		#--disable-sha1                 # disable SHA1 software implementation plugin.
		#--disable-sha2                 # disable SHA256/SHA384/SHA512 software implementation
		#--disable-socket-default       # default socket implementation for charon.
		#--disable-sshkey               # disable SSH key decoding plugin.
		--disable-stroke                # disable charons stroke configuration backend.
		#--disable-swanctl              # disable swanctl configuration and control tool.
		#--disable-updown               # disable updown firewall script plugin.
		#--disable-vici                 # disable strongSwan IKE generic IPC interface plugin.
		#--disable-x509                 # disable X509 certificate implementation plugin.
		#--disable-xauth-generic        # disable generic XAuth backend.
		#--disable-xcbc                 # disable xcbc crypto implementation plugin.

		### OPTIONAL FEATURES
		#--enable-acert                 # enable X509 attribute certificate checking plugin.
		#--enable-addrblock             # enables RFC 3779 address block constraint support.
		--enable-aesni                  # enable Intel AES-NI crypto plugin.
		--enable-af-alg                 # enable AF_ALG crypto interface to Linux Crypto API.
		--enable-agent                  # enables the ssh-agent signing plugin.
		#--enable-aikgen                # enable AIK generator.
		--enable-attr-sql               # enable SQL based configuration attribute plugin.
		#--enable-bfd-backtraces        # use binutils libbfd to resolve backtraces for memory and segfaults.
		--enable-bliss                  # enable BLISS software implementation plugin.
		#--enable-blowfish              # enable Blowfish software implementation plugin.
		--enable-ccm                    # enables the CCM AEAD wrapper crypto plugin.
		#--enable-certexpire            # enable CSV export of expiration dates of used
		--enable-chapoly                # enables the ChaCha20/Poly1305 AEAD plugin.
		--enable-cmd                    # enable the command line IKE client charon-cmd.
		#--enable-conftest              # enforce Suite B conformance test framework.
		--enable-connmark               # enable connmark plugin using conntrack based marks select return path SA.
		#--enable-coupling              # enable IKEv2 plugin to couple peer certificates to authentication.
		#--enable-coverage              # enable lcov coverage report generation.
		--enable-ctr                    # enables the Counter Mode wrapper crypto plugin.
		--enable-curl                   # enable CURL fetcher plugin to fetch files via Requires libcurl.
		--enable-dhcp                   # enable DHCP based attribute provider plugin.
		--enable-dnscert                # enable DNSCERT authentication plugin.
		#--enable-dumm                  # enable the DUMM UML test framework.
		--enable-duplicheck             # advanced duplicate checking plugin using liveness
		--enable-eap-aka                # enable EAP AKA authentication module.
		--enable-eap-aka-3gpp2          # enable EAP AKA backend implementing 3GPP2 algorithms software. Requires libgmp.
		--enable-eap-dynamic            # enable dynamic EAP proxy module.
		--enable-eap-gtc                # enable EAP GTC authentication module.
		--enable-eap-identity           # enable EAP module providing EAP-Identity helper.
		--enable-eap-md5                # enable EAP MD5 (CHAP) authentication module.
		--enable-eap-mschapv2           # enable EAP MS-CHAPv2 authentication module.
		--enable-eap-peap               # enable EAP PEAP authentication module.
		--enable-eap-radius             # enable RADIUS proxy authentication module.
		--enable-eap-sim                # enable SIM authentication module for EAP.
		--enable-eap-sim-file           # enable EAP-SIM backend based on a triplet file.
		--enable-eap-sim-pcsc           # enable EAP-SIM backend based on a smartcard reader. libpcsclite.
		--enable-eap-simaka-pseudonym   # EAP-SIM/AKA pseudonym storage plugin.
		--enable-eap-simaka-reauth      # EAP-SIM/AKA reauthentication data storage
		--enable-eap-simaka-sql         # enable EAP-SIM/AKA backend based on a SQL database.
		--enable-eap-tls                # enable EAP TLS authentication module.
		--enable-eap-tnc                # enable EAP TNC trusted network connect module.
		--enable-eap-ttls               # enable EAP TTLS authentication module.
		--enable-error-notify           # enable error notification plugin.
		--enable-ext-auth               # enable plugin calling an external authorization
		--enable-farp                   # enable ARP faking plugin that responds to ARP to peers virtual IP
		#--enable-fast                  # enable libfast (FastCGI Application Server w/
		--enable-files                  # enable simple file:// URI fetcher.
		--enable-forecast               # enable forecast plugin forwarding messages.
		--enable-gcm                    # enables the GCM AEAD wrapper crypto plugin.
		--enable-gcrypt                # enables the libgcrypt plugin.
		--enable-ha                     # enable high availability cluster plugin.
		#--enable-imc-attestation       # IMC attestation module.
		#--enable-imc-hcd               # enable IMC hcd module.
		#--enable-imc-os                # enable IMC operating system module.
		#--enable-imc-scanner           # enable IMC port scanner module.
		#--enable-imc-swid              # enable IMC swid module.
		#--enable-imc-test              # enable IMC test module.
		#--enable-imv-attestation       # IMV attestation module.
		#--enable-imv-hcd               # enable IMV hcd module.
		#--enable-imv-os                # enable IMV operating system module.
		#--enable-imv-scanner           # enable IMV port scanner module.
		#--enable-imv-swid              # enable IMV swid module.
		#--enable-imv-test              # enable IMV test module.
		#--enable-integrity-test        # enable integrity testing of libstrongswan and
		--enable-ipseckey               # enable IPSECKEY authentication plugin.
		#--enable-kernel-libipsec       # the libipsec kernel interface.
		--enable-ldap                   # enable LDAP fetching plugin to fetch files via Requires openLDAP.
		#--enable-leak-detective        # enable malloc hooks to find memory leaks.
		--enable-led                    # enable plugin to control LEDs on IKEv2 activity the Linux kernel LED subsystem.
		#--enable-libipsec              # enable user space IPsec implementation.
		#--enable-load-tester           # enable load testing plugin for IKEv2 daemon.
		#--enable-lock-profiler         # enable lock/mutex profiling code.
		--enable-log-thread-ids         # use thread ID, if available, instead of an value starting from 1, to identify
		--enable-lookip                 # enable fast virtual IP lookup and notification
		#--enable-manager               # enable web management console (proof of concept).
		--enable-md4                    # enable MD4 software implementation plugin.
		#--enable-medcli                # enable mediation client configuration database
		#--enable-mediation             # enable IKEv2 Mediation Extension.
		#--enable-medsrv                # enable mediation server web frontend and daemon
		--enable-mysql                  # enable MySQL database support. Requires
		--enable-nm                     # enable NetworkManager backend.
		--enable-ntru                   # enables the NTRU crypto plugin.
		--enable-openssl                # enables the OpenSSL crypto plugin.
		--enable-p-cscf                 # enable plugin to request P-CSCF server addresses an ePDG.
		#--enable-padlock               # enables VIA Padlock crypto plugin.
		#--enable-perl-cpan             # enable build of provided perl CPAN module.
		#--enable-perl-cpan-install     # installation of provided CPAN module.
		--enable-pkcs11                 # enables the PKCS11 token support plugin.
		#--enable-python-eggs           # enable build of provided python eggs.
		#--enable-python-eggs-install   # installation of provided python eggs.
		--enable-radattr                # enable plugin to inject and process custom RADIUS as IKEv2 client.
		--enable-rdrand                 # enable Intel RDRAND random generator plugin.
		#--enable-ruby-gems             # enable build of provided ruby gems.
		#--enable-ruby-gems-install     # installation of provided ruby gems.
		--enable-sha3                   # enable SHA3_224/SHA3_256/SHA3_384/SHA3_512 software plugin.
		#--enable-smp                   # enable SMP configuration and control interface. libxml.
		--enable-socket-dynamic         # enable dynamic socket implementation for charon
		#--enable-soup                  # enable soup fetcher plugin to fetch from HTTP via Requires libsoup.
		--enable-sql                    # enable SQL database configuration backend.
		--enable-sqlite                 # enable SQLite database support. Requires libsqlite3.
		--enable-systemd                # enable systemd specific IKE daemon charon-systemd.
		#--enable-systime-fix           # enable plugin to handle cert lifetimes with invalid time gracefully.
		--enable-test-vectors           # enable plugin providing crypto test vectors.
		#--enable-tkm                   # enable Trusted Key Manager support.
		#--enable-tnc-ifmap             # enable TNC IF-MAP module. Requires libxml
		#--enable-tnc-imc               # enable TNC IMC module.
		#--enable-tnc-imv               # enable TNC IMV module.
		#--enable-tnc-pdp               # enable TNC policy decision point module.
		#--enable-tnccs-11              # enable TNCCS 1.1 protocol module. Requires libxml
		#--enable-tnccs-20              # enable TNCCS 2.0 protocol module.
		#--enable-tnccs-dynamic         # enable dynamic TNCCS protocol discovery module.
		#--enable-uci                   # enable OpenWRT UCI configuration plugin.
		--enable-unbound                # enable UNBOUND resolver plugin to perform DNS via libunbound. Requires libldns and
		--enable-unity                  # enables Cisco Unity extension plugin.
		#--enable-unwind-backtraces     # libunwind to create backtraces for memory leaks segfaults.
		#--enable-whitelist             # enable peer identity whitelisting plugin.
		--enable-xauth-eap              # enable XAuth backend using EAP methods to verify
		--enable-xauth-noauth           # enable XAuth pseudo-backend that does not actually or even request any credentials.
		--enable-xauth-pam              # enable XAuth backend using PAM to verify passwords.

		### OPTIONAL PACKAGES
		--with-capabilities=native                   # set capability dropping library. Currently supported values are "libcap" and "native" (default: no).
		--with-dev-headers=/usr/include/strongswan   # install strongSwan development headers to directory. (default: no).
		--with-piddir=/run/strongswan                # set path for PID and UNIX socket files (default: /var/run).
		--with-random-device=/dev/urandom            # the device to read real random data from (default: /dev/random).
		--with-swanctldir=/etc/strongswan.d/swanctl  # base directory for swanctl configuration files and credentials (default: ${sysconfdir}/swanctl).
	)

	cd ${pkgname}
	./configure "${__configure_args[@]}"
	make -j1
}

package() {
	cd ${pkgname}
	make DESTDIR=${pkgdir} install
	install -Dm644 "$srcdir/strongswan.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/strongswan.conf"
}

