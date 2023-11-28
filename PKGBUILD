# Maintainer: dakataca <🐬danieldakataca@gmail.com>

pkgname=pgadmin4-py
_pkgname=${pkgname%[0-9]*}
__pkgname=${pkgname%-*}
pkgver=7.8
pkgrel=1
pkgdesc='Most popular and feature rich Open Source administration and development platform for PostgreSQL'
url='https://www.pgadmin.org/'
arch=(x86_64)
license=(GPL3)
makedepends=('python-pip' 'python-build' 'python-installer' 'python-wheel' 'python-authlib')
depends=('postgresql' 'translate-shell' 'openbsd-netcat' 'e2fsprogs')

# Alistar ficheros en el directorio de instalación.
package() {
    # pgadmin configs.
    install -o $USER -g $USER -dvm 755 "$pkgdir/var/lib/$_pkgname/"
    install -o $USER -g $USER -dvm 755 "$pkgdir/var/log/$_pkgname/"
    install -dvm 755 "$pkgdir/opt/venvs/"

    # Existe /var/lib/postgres/?
    if [ ! -d "/var/lib/postgres/" ]; then
        install -o postgres -g postgres -dvm 755 "$pkgdir/var/lib/postgres/"
    fi
    cd $pkgdir/opt/venvs/
    python3 -m venv $__pkgname 
    source $__pkgname/bin/activate
    pip install $__pkgname

    # Script de ejecución pgadmin4.
    install -Dvm755 <(cat <<'EOF'
#!/usr/bin/env bash

translate_str() {
   local -r lang=${LANG%_[A-Z][A-Z].UTF-8}
   local str=""
   if [[ $lang == en ]]; then
       str=$1
   elif [[ $lang == es ]]; then
       str=$2
   else
       str=`trans -b :$lang "$str"`
   fi
   echo "$str"
}

open_server() {
    sleep 1
    while ! nc -z 127.0.0.1 5050; do
        sleep 1
    done
    [ $? -eq 0 ] && xdg-open http://127.0.0.1:5050
}

validate_postgres_password() {
    declare -r command="$1" level="$2"
    
    while true; do
        # Solicitar la credenciales.
        translate_str "Enter the postgres user's credentials at the $level" \
	"Ingrese las credenciales del usuario postgres a nivel de $level:"
        bash -c "$command"

        # Validar el éxito del comando anterior
        if (( $? == 0 )); then
            translate_str "Valid password. Continuing..."  "Contraseña válida. Continuando..."
            break
        else
            translate_str "Incorrect password. Please try again." "Contraseña incorrecta. Inténtelo de nuevo."
        fi
    done
}
 
# Comprobar si el usuario es root.
if [ "$EUID" -ne 0 ]; then
    declare -r data=/var/lib/postgres/data \
        pg_hba=/var/lib/postgres/data/pg_hba.conf \
        postgres_config=/var/lib/postgres/data/postgresql.conf

    # Existe fichero de configuración base de datos postgres?
    if ! sudo test -f "$pg_hba"; then

        sudo -iu postgres initdb -D $data --data-checksums

        # Sistema de ficheros es BTRFS?
	# 🌐 wiki: https://wiki.archlinux.org/title/Btrfs#Copy-on-Write_(CoW)
        if [ `stat -f -c %T $data` == btrfs ]; then
            echo "Sistema de ficheros es BTRFS"

            # Copia en escritura (copy on write) activo en BTRFS?
            if [[ `sudo lsattr -dl $data` =~ No_COW ]]; then
                echo "No_COW activo en BTRFS $data"
            else
                echo "No_COW activando en BTRFS $data"
                sudo chattr +C $data
                sudo lsattr -dl $data
            fi
        fi

        # Restricts access rights to the database superuser by default.
	# 🌐 wiki: https://wiki.archlinux.org/title/PostgreSQL#Restricts_access_rights_to_the_database_superuser_by_default
        sudo grep -E 'local +all +postgres +peer' $pg_hba || sudo sed -Ei.back \
"s/^(local +all +)all +trust$/\1postgres\t\t\t\tpeer\n\
# "local" is for Unix domain socket connections only\n\
local\tall\t\t$USER\t\t\t\t\tscram-sha-256/" $pg_hba

	# Require password for login.
        # 🌐 wiki: https://wiki.archlinux.org/title/PostgreSQL#Require_password_for_login
        sudo grep -E "^listen_addresses = 'localhost'*" $postgres_config || sudo sed -i.back \
            "/^#password_encryption =*/  s/^#// ; \
            /listen_addresses = 'localhost'/ s/^#//" $postgres_config

        [[ `systemctl is-active --quiet postgresql.service` ]] && sudo systemctl restart postgresql.service || sudo systemctl start postgresql.service

        # Contraseña de usuario postgres a nivel de Base de Datos postgresql.
	# 🌐 wiki: https://www.postgresql.org/docs/current/app-psql.html
	# 📜 man-page: https://wiki.archlinux.org/title/PostgreSQL#Access_the_database_shell
        validate_postgres_password "sudo -u postgres psql -c '\password'" "postgresql"
   
        # Contraseña de usuario postgres a nivel de Base de Datos postgresql.
        translate_str "User password \"postgres\" at the level of ArchLinux Operating System:" "Contraseña de usuario \"postgres\" a nivel de Sistema Operativo ArchLinux:"

        # Contraseña de usuario postgres a nivel de Sistema Operativo Linux.
        validate_postgres_password "sudo passwd postgres" "S.O Archlinux"

        # Crear credenciales de superusuario.
	# 📜 man-page: https://www.postgresql.org/docs/current/app-createuser.html
        validate_postgres_password "sudo -iu postgres createuser --password --interactive --createrole --superuser --createdb" "superusuario $USER"
    fi

    # Servicio postgresql.service está activo?
    [[ `systemctl is-active --quiet postgresql.service` ]] && sudo systemctl restart postgresql.service || sudo systemctl start postgresql.service

    # Activar entorno virtual pgadmin4.
    source /opt/venvs/pgadmin4/bin/activate
    open_server &
    #[ $? -eq 0 ] && xdg-open http://127.0.0.1:5050
    pgadmin4
else
    translate_str "Error: You can't perform this operation as a superuser."\
    "Error: No puede realizar esta operación siendo superusuario."
fi
EOF
) $pkgdir/usr/bin/$__pkgname
}

## References:
# Support: pgadmin-support@lists.postgresql.org
# Website: https://www.pgadmin.org/
# Tracker: https://github.com/pgadmin-org/pgadmin4/issues https://www.pgadmin.org/
# Guide: https://www.pgadmin.org/download/pgadmin-4-python/

## Test:
# updpkgsums
# makepkg --printsrcinfo > .SRCINFO

## Clean:
# sudo pacman -Rnsc pgadmin4-py --noconfirm
# sudo rm -rf /var/lib/p{ostgres,gadmin}/
# git clean -dfx

# 👤 Autor: https://t.me/dakataca 💻 🐬 #
