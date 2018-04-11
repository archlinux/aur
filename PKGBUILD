#
# Maintainer: Michael Rynn <michael.rynn@parracan.org>
# Contributor: wolftankk <wolftankk@gmail.com>

php_suffix="70" # This mutation
php_ext="phalcon"
pkgname="php${php_suffix}-${php_ext}"
pkgver=3.3.2
pkgrel=1
pkgdesc="PHP Extension package for a faster web site framework."
url="http://phalconphp.com"
arch=('x86_64' 'i686')

[[ $CARCH == 'i686' ]] && _arch=32bits || _arch=64bits
license=('PHP')
depends=("php${php_suffix}")

makedepends=('gcc')

source=(
	"https://github.com/phalcon/cphalcon/archive/v$pkgver.zip"
)

sha256sums=(
  '1f5bd8d0d43762e4177716342adcfeb71df2859f78a56bed9c66040bb293dbf3'
)



# find which accessible php-config[suffix], use in 
# makepkg not meant to be interactive. Assume this PKGBUILD stays in AUR
# locate php-config[suffix], get options
# xdebug build uses phpize[suffix]

php_select()
{
    declare -a php_configy # paths
    
    # pass a folder to be searched for any php-config*
    findconfig()
    {
      local _myglob="$1/php-config${php_suffix}*"
      for f in $_myglob; 
      do
        if [ "$f" != "$_myglob" ]; then
          php_configy+=("$f")
        fi
      done
    }

    binpath="${PATH}"

    re='([^:]+):(.*)'
    while [[ $binpath =~ $re ]]
    do
      bindir="${BASH_REMATCH[1]}"
      binpath="${BASH_REMATCH[2]}"
      findconfig $bindir
    done
    if [[ -n $binpath ]]; then
      findconfig $binpath
    fi

    # see how many we have
    optct="${#php_configy[@]}"

    # if only one, do automatic??
    if [[ $optct -lt "1" ]]; then
        echo "No php-config* found"
        exit -1
    elif [[ $optct -eq "1" ]]; then
        php_config="${php_configy[0]}"
    else 
      declare -a php_options # assemble user menu
      optct=0
      php_options+=("0) Get me out of here!")
      for cfg in "${php_configy[@]}"; 
      do
        let optct='((optct+1))'
        PHP_FULL_VERSION=`${cfg} --version`
        php_options+=("${optct}) ${cfg}  (php-${PHP_FULL_VERSION})")
      done
      echo
      echo "More than one php-config found. Select:"
      echo
      for opt in "${php_options[@]}"; do
        echo $opt
      done
      echo
      read -p "Which php-config do you want? " choice
      numbers='[0-9]+$'
      if ! [[ "${choice}" =~ $numbers ]]; then
        echo "bye"
        exit
      fi
      if [[ ( "${choice}" -gt "$optct" ) || ( "${choice}" -lt  "1" ) ]]; then
        echo "OK"
        exit
      fi
      let choice='((choice-1))'
      php_config="${php_configy[$choice]}"
    fi
    
    #get some config options,  assumable from php70
    all_options=`${php_config} --configure-options`

    declare -A config_options # AA for key lookup
    attre='--([^=]+)=(.*)'
    for option in $all_options; do
        [[ $option =~ $attre ]] && vname="${BASH_REMATCH[1]}" && nvalue="${BASH_REMATCH[2]}"
        config_options[$vname]=$nvalue
    done
    PHP_FULL_VERSION=`${php_config} --version`
    PHP_VERSION="${PHP_FULL_VERSION%%.*}"
     #get php version 
    PHP_MINOR_VERSION="${PHP_FULL_VERSION%.*}"
    if [[ "${PHP_VERSION}" == "7" ]]; then
      if [ $(echo " $PHP_MINOR_VERSION >= 7.1" | bc) -eq 1 ]; then
        echo "Phalcon not yet supported for php > 7.0"
        exit
      fi
    fi
    PHALCON_BUILD="php${PHP_VERSION}"
    # export so makepkg remembers. PHP-build dependent
    export PHPCONFIG_SCANDIR="${config_options[with-config-file-scan-dir]#/*}"
    export PHPIZE_CMD="phpize${config_options[program-suffix]}"
    export PHPCONFIG_CMD="${php_config}"
    export PHALCON_BUILD
}

prepare()
{
    echo "PHALCON_BUILD is ${PHALCON_BUILD}"
    echo "_arch is $_arch"  
}    

build() {
  cd "$srcdir/cphalcon-$pkgver"
  #Check best compilation flags for GCC
  export CC="gcc"
  export CFLAGS="-march=native -mtune=native -O2 -fomit-frame-pointer"
  export CPPFLAGS="-DPHALCON_RELEASE"
  echo 'int main() {}' > t.c
  $CC $CFLAGS t.c -o t 2> t.t
  if [ $? != 0 ]; then
	  chmod +x gcccpuopt
	  BFLAGS=`./gcccpuopt`
	  export CFLAGS="-O2 -fomit-frame-pointer $BFLAGS"
	  $CC $CFLAGS t.c -o t 2> t.t
	  if [ $? != 0 ]; then
		  export CFLAGS="-O2"
	  fi
  fi

  if [ $($CC -dumpversion | cut -f1 -d.) -ge 4 ]; then
	  $CC $CFLAGS -fvisibility=hidden t.c -o t 2> t.t && export CFLAGS="$CFLAGS -fvisibility=hidden"
  fi

  rm -f t.t t.c t


  #cd dir
  cd "$srcdir/cphalcon-$pkgver/build/$PHALCON_BUILD/$_arch"

  #Clean current compilation
  if [ -f Makefile ]; then
	  make clean
	  $PHPIZE_CMD --clean
  fi

  $PHPIZE_CMD
  ./configure --prefix=/usr --enable-phalcon
  make
}

package() {
  backup=("${PHPCONFIG_SCANDIR}/phalcon.ini")
  cd "$srcdir/cphalcon-$pkgver/build/$PHALCON_BUILD/$_arch"

  make INSTALL_ROOT="$pkgdir" install
  echo 'extension=phalcon.so' > phalcon.ini 
  install -Dm644 phalcon.ini "$pkgdir/${PHPCONFIG_SCANDIR}/phalcon.ini"
}

if [[ -z $PHALCON_BUILD ]]; then
  php_select
fi
