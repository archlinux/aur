#!/bin/bash
#Var-----------------------------------------------------------
WHITE="\033[1m"
LIGHTRED="\033[1;31m"
RED="\033[31m"
YELLOW="\033[1;33m"
BLUE="\033[34m"
BLUEB="\033[1;34m"
GREEN="\033[32m"
GREENB="\033[1;32m"
ENDCOLOR="\033[0m"
#--------------------------------------------------------------
#Internet Init-------------------------------------------------
echo Starting...
WVER=`wget -h | head -1 | sed 's/[^0-9]*//g'`
DVER=`dialog --version | head -1 | sed 's/-.*//g' | sed 's/[^0-9]*//g'`
if [ "$WVER" -ge 116 ]; then
	if ! [ "$DVER" -ge 12 ]; then
		clear
		echo -e $RED"ERROR: Dialog v1.2 or later is not installed."$ENDCOLOR
		echo
		echo -e $GREEN"Press the ENTER key to exit"$ENDCOLOR
		read
		clear
		exit
	fi
else
	if [ "$DVER" -ge 12 ]; then
		clear
		echo -e $RED"ERROR: Wget v1.16 is not installed."$ENDCOLOR
		echo
		echo -e $GREEN"Press the ENTER key to exit"$ENDCOLOR
		read
		clear
		exit
	else
		clear
		echo -e $RED"ERROR: Wget v1.16 or later is not installed."$ENDCOLOR
		echo -e $RED"ERROR: Dialog v1.2 or later is not installed."$ENDCOLOR
		echo
		echo -e $GREEN"Press the ENTER key to exit"$ENDCOLOR
		read
		clear
		exit
	fi
fi
echo '
#Var-----------------------------------------------------------
WHITE="\033[1m"
LIGHTRED="\033[1;31m"
RED="\033[31m"
YELLOW="\033[1;33m"
BLUE="\033[34m"
BLUEB="\033[1;34m"
GREEN="\033[32m"
GREENB="\033[1;32m"
ENDCOLOR="\033[0m"
#--------------------------------------------------------------
INIT=`wget -q -O /tmp/con.ns --tries=4 --timeout=16 https://bitbucket.org/NjlsShade/adaway/raw/master/init.ns`
CON=`cat /tmp/con.ns`
rm -f /tmp/con.ns
while ! [ $CON == 1 ]
	do
		clear		
		echo "You are$STILL not connected to the Internet."
		$ADDED
		echo If you need to enter a proxy address, type 'proxy' and press enter.
		echo
		echo "Press [ENTER] to try again. Or press Ctrl+C to exit."
		echo
		read PROX
		if [[ $PROX == proxy ]] || [[ $PROX == p ]] || [[ $PROX == PROXY ]] || [[ $PROX == P ]]; then
			clear
			echo -e $RED"This is an experimental feature, make sure the URL and port are correct."$ENDCOLOR
			echo
			echo -e -n $BLUEB"$USER@AdAway [Proxy URL]: "$ENDCOLOR
			read PURL
			if [[ $PURL == *.*.*:* ]]; then
				export http_proxy="$PURL"
				export https_proxy="$PURL"
				export ssl_proxy="$PURL"
				export ftp_proxy="$PURL"
				echo $PURL > /tmp/proxy_ad.txt
			else
				clear
				echo -e $RED"You did not enter a valid URL [XXX.XXX.XXX:XXX]"$ENDCOLOR
				echo
				echo Restarting in [5]
				sleep 1
				clear
				echo -e $RED"You did not enter a valid URL [XXX.XXX.XXX:XXX]"$ENDCOLOR
				echo
				echo Restarting in [4]
				sleep 1
				clear
				echo -e $RED"You did not enter a valid URL [XXX.XXX.XXX:XXX]"$ENDCOLOR
				echo
				echo Restarting in [3]
				sleep 1
				clear
				echo -e $RED"You did not enter a valid URL [XXX.XXX.XXX:XXX]"$ENDCOLOR
				echo
				echo Restarting in [2]
				sleep 1
				clear
				echo -e $RED"You did not enter a valid URL [XXX.XXX.XXX:XXX]"$ENDCOLOR
				echo
				echo Restarting in [1]
				sleep 1
				clear
			fi
		fi
clear
STILL=" still"
ADDED="echo Make sure you are connected to a network with Internet access."
echo -e $GREENB"Please wait..."$ENDCOLOR
INIT=`wget -q -O /tmp/con.ns --tries=8 --timeout=16 https://bitbucket.org/NjlsShade/adaway/raw/master/init.ns`
CON=`cat /tmp/con.ns`
rm -f /tmp/con.ns

done' > /tmp/init.sh
clear
echo -e $GREENB"Please wait..."$ENDCOLOR
chmod +x /tmp/init.sh
bash /tmp/init.sh
rm -f /tmp/init.sh
clear
#Start---------------------------------------------------------
cd ~
clear
echo -e $WHITE"AdAway"$ENDCOLOR
echo
echo -e "Please enter your password"
echo
#Password------------------------------------------------------
cat > /tmp/pass.sh << 'PASS'
#Var-----------------------------------------------------------
WHITE="\033[1m"
LIGHTRED="\033[1;31m"
RED="\033[31m"
YELLOW="\033[1;33m"
BLUE="\033[34m"
GREEN="\033[32m"
ENDCOLOR="\033[0m"
#--------------------------------------------------------------
unset PASSWORD
unset CHARCOUNT

echo -e -n $BLUE"Password: "$ENDCOLOR

stty -echo

CHARCOUNT=0
while IFS= read -p "$PROMPT" -r -s -n 1 CHAR
do
    if [[ $CHAR == $'\0' ]]; then
        break
    fi
    if [[ $CHAR == $'\177' ]]; then
        if [ $CHARCOUNT -gt 0 ]; then
            CHARCOUNT=$((CHARCOUNT-1))
            PROMPT=$'\b \b'
            PASSWORD="${PASSWORD%?}"
        else
            PROMPT=''
        fi
    else
        CHARCOUNT=$((CHARCOUNT+1))
        PROMPT='*'
        PASSWORD+="$CHAR"
    fi
done

stty echo

echo
clear
echo -e $RED"The password given is being checked."$ENDCOLOR
echo -e $RED"Root will be requested with the system prompt if it fails."$ENDCOLOR
echo $PASSWORD | sudo -S clear >/dev/null 2>&1
echo
sudo echo
PASS
chmod +x /tmp/pass.sh
bash /tmp/pass.sh
rm -f /tmp/pass.sh
clear
#Main----------------------------------------------------------
echo -e $GREENB"Please choose an option below"$ENDCOLOR
echo
echo -e $GREEN"[i]         Install AdAway"$ENDCOLOR
echo -e $GREEN"[u]         Uninstall AdAway"$ENDCOLOR
echo -e $GREEN"[e]         Exit"$ENDCOLOR
echo
echo -e -n $BLUEB"$USER@AdAway $ "$ENDCOLOR
read ANS
if [[ $ANS == [iI] ]]; then
	clear
	echo -e $GREENB'Are you sure you want to install AdAway?'$ENDCOLOR
	echo -e $GREEN'(A back up of your hosts file will be made)'$ENDCOLOR
	echo
	echo -e -n $BLUEB"$USER@AdAway $ "$ENDCOLOR
	read ANS
	if [[ $ANS == [Yy] ]] || [ $ANS == 'YES' ] || [ $ANS == 'Yes' ] || [ $ANS == 'yes' ]; then
		INSTL=`cat ~/.adaway/files/version/installed.txt 2> /dev/null`
		if ! [ "$INSTL" == 1 ]; then
			if [ "$INSTL" == 0 ]; then
				clear
				echo -e $GREENB"AdAway was previously removed, but it's configurations were left in tact"$ENDCOLOR
				echo -e $GREEN"Would you like to install AdAway with the existing configurations?"$ENDCOLOR
				echo
				echo -e -n $BLUEB"$USER@AdAway $ "$ENDCOLOR
				read ANS
				if [[ $ANS == [Yy] ]] || [ $ANS == 'YES' ] || [ $ANS == 'Yes' ] || [ $ANS == 'yes' ]; then
					HOSTD=`grep -Po "127.0.1.1 $HOSTNAME" ~/.adaway/backup/hosts`
					if [ "$HOSTD" == "127.0.1.1 $HOSTNAME" ]; then
						sudo cp -f ~/.adaway/backup/hosts /etc/hosts
					fi
					wget -q -O ~/.adaway/tmp/adaway "https://bitbucket.org/NjlsShade/adaway/raw/master/adaway"
					wget -q -O ~/.adaway/tmp/update.ns "https://bitbucket.org/NjlsShade/adaway/raw/master/update.ns"
					sudo mv -f ~/.adaway/tmp/adaway /usr/local/bin
					sudo mv -f ~/.adaway/tmp/update.ns ~/.adaway/files/version/version.ns
					sudo chmod 0755 /usr/local/bin/adaway
					echo "1" > ~/.adaway/files/version/installed.txt
					clear
					echo -e $GREENB"AdAway has been installed successfully!"$ENDCOLOR
					echo -e $GREEN"Press the any key to exit"$ENDCOLOR
					read
					exit
				fi
			fi
			rm -rf ~/.adaway
			mkdir -p ~/.adaway/backup
			mkdir -p ~/.adaway/files/version
			mkdir -p ~/.adaway/files/database
			mkdir -p ~/.adaway/files/hosts
			mkdir -p ~/.adaway/quarantine
			mkdir -p ~/.adaway/tmp
			mkdir -p ~/.adaway/files/proxy
			mkdir -p ~/.adaway/files/config
			touch ~/.adaway/files/database/custom_data.txt
			touch ~/.adaway/files/database/custom_url.txt
			touch ~/.adaway/files/database/servers.txt
			if [ -s /tmp/proxy_ad.txt ]; then
				mv -f /tmp/proxy_ad.txt ~/.adaway/files/proxy/proxy_ad.txt
				PURLI=`cat ~/.adaway/files/proxy/proxy_ad.txt`
				export http_proxy="$PURLI"
				export https_proxy="$PURLI"
				export ssl_proxy="$PURLI"
				export ftp_proxy="$PURLI"
			fi
			echo "0" > ~/.adaway/quarantine/disable.txt
			echo "0" > ~/.adaway/files/database/c_servers.txt
			echo "0" > ~/.adaway/files/database/query_server.txt
#1			echo "0" > ~/.adaway/files/database/server_config.txt
			echo "0.1.0" > ~/.adaway/files/version/script.txt
			echo "1" > ~/.adaway/files/version/installed.txt
			if ! [ -s ~/.dialogrc ]; then
				echo 'aspect = 0
separate_widget = ""
tab_len = 0
visit_items = OFF
use_shadow = OFF
use_colors = OFF
screen_color = (WHITE,DEFAULT,OFF)
shadow_color = (WHITE,WHITE,OFF)
dialog_color = (WHITE,BLACK,OFF)
title_color = (GREEN,BLACK,OFF)
border_color = (WHITE,BLACK,OFF)
button_active_color = (BLACK,YELLOW,OFF)
button_inactive_color = (WHITE,BLACK,OFF)
button_key_active_color = (BLACK,GREEN,OFF)
button_key_inactive_color = (RED,BLACK,OFF)
button_label_active_color = (BLACK,GREEN,OFF)
button_label_inactive_color = (WHITE,BLACK,OFF)
inputbox_color = (WHITE,BLACK,OFF)
inputbox_border_color = (BLACK,BLACK,OFF)
searchbox_color = (WHITE,BLACK,OFF)
searchbox_title_color = (GREEN,BLACK,OFF)
searchbox_border_color = (WHITE,BLACK,OFF)
position_indicator_color = (GREEN,BLACK,OFF)
menubox_color = (BLACK,BLACK,OFF)
menubox_border_color = (BLACK,BLACK,OFF)
item_color = (WHITE,BLACK,OFF)
item_selected_color = (BLACK,GREEN,OFF)
tag_color = (BLUE,BLACK,OFF)
tag_selected_color = (BLACK,GREEN,OFF)
tag_key_color = (YELLOW,BLACK,OFF)
tag_key_selected_color = (BLACK,GREEN,OFF)
check_color = (WHITE,BLACK,OFF)
check_selected_color = (BLACK,GREEN,OFF)
uarrow_color = (GREEN,BLACK,OFF)
darrow_color = (GREEN,BLACK,OFF)
itemhelp_color = (BLACK,WHITE,OFF)
form_active_text_color = (BLACK,BLUE,OFF)
form_text_color = (WHITE,BLACK,OFF)
form_item_readonly_color = (BLACK,WHITE,OFF)' > ~/.dialogrc
				echo "0" > ~/.adaway/files/config/dialogrc.cfg
			else
				echo "1" > ~/.adaway/files/config/dialogrc.cfg
			fi
			sudo cp /etc/hosts ~/.adaway/backup/hosts
			wget -q -O ~/.adaway/tmp/adaway "https://bitbucket.org/NjlsShade/adaway/raw/master/adaway"
			wget -q -O ~/.adaway/tmp/update.ns "https://bitbucket.org/NjlsShade/adaway/raw/master/update.ns"
			sudo mv -f ~/.adaway/tmp/adaway /usr/local/bin
			sudo mv -f ~/.adaway/tmp/update.ns ~/.adaway/files/version/version.ns
			sudo chmod 0755 /usr/local/bin/adaway
			clear
			echo -e $GREENB"AdAway has been installed successfully!"$ENDCOLOR
			echo -e $GREEN"Press the any key to exit"$ENDCOLOR
			read
		else
			TST=`adaway --version | grep -Po "AdAway v" 2> /dev/null`
			if [[ "$TST" == "AdAway v" ]]; then
				clear
				echo -e $GREENB"Adaway is already installed!"$ENDCOLOR
				echo -e $GREEN"Press any key to exit"$ENDCOLOR
				read
				clear
			else
				clear
				echo -e $GREENB"AdAway configuration files have been detected, but, AdAway binary is missing."$ENDCOLOR
				echo -e $GREEN"Would you like to remove the junk fragments of AdAway found on your computer?"$ENDCOLOR
				echo
				echo -e $RED"[THIS WILL REMOVE ALL PRIOR CONFIGURATIONS!]"$ENDCOLOR
				echo -e -n $BLUEB"$USER@AdAway $ "$ENDCOLOR
				read "ANS"
				if [[ "$ANS" == [Yy] ]] || [ $ANS == 'YES' ] || [ $ANS == 'Yes' ] || [ $ANS == 'yes' ]; then
					HOSTD=`grep -Po "127.0.1.1 $HOSTNAME" ~/.adaway/backup/hosts`
					if [ "$HOSTD" == "127.0.1.1 $HOSTNAME" ]; then
						sudo cp -f ~/.adaway/backup/hosts /etc/hosts
					fi
					sudo rm -rf /usr/local/bin/adaway
					DIALOGRC=`cat ~/.adaway/files/config/dialogrc.cfg`
					if [[ DIALOGRC == "0" ]]; then
						sudo rm -rf ~/.dialogrc
					fi
					sudo rm -rf ~/.adaway
					clear
					echo -e $GREENB"Junk configuration files successfully removed!"$ENDCOLOR
					echo -e $GREEN"Press the any key to exit"$ENDCOLOR
					read
					clear
					exit
				else
					clear
					echo -e $RED'Cleaning up, then Exiting installer [4]'$ENDCOLOR
					sleep 1
					clear
					echo -e $RED'Cleaning up, then Exiting installer [3]'$ENDCOLOR
					sleep 1
					clear
					echo -e $RED'Cleaning up, then Exiting installer [2]'$ENDCOLOR
					sleep 1
					clear
					echo -e $RED'Cleaning up, then Exiting installer [1]'$ENDCOLOR
					sleep 1
					clear
				fi
			fi
		fi
	else
		clear
		echo -e $RED'Cleaning up, then Exiting installer [4]'$ENDCOLOR
		sleep 1
		clear
		echo -e $RED'Cleaning up, then Exiting installer [3]'$ENDCOLOR
		sleep 1
		clear
		echo -e $RED'Cleaning up, then Exiting installer [2]'$ENDCOLOR
		sleep 1
		clear
		echo -e $RED'Cleaning up, then Exiting installer [1]'$ENDCOLOR
		sleep 1
		clear
		exit
	fi
fi
if [[ "$ANS" == [Uu] ]]; then
	clear
	echo -e $GREENB"Are you sure you want to completely uninstall AdAway?"$ENDCOLOR
	echo -e $RED"[This will remove AdAway and all configurations!]"$ENDCOLOR
	echo
	echo -e -n $BLUEB"$USER@AdAway $ "$ENDCOLOR
	read ANS
	if [[ $ANS == [Yy] ]] || [ $ANS == 'YES' ] || [ $ANS == 'Yes' ] || [ $ANS == 'yes' ]; then
		INSTL=`cat ~/.adaway/files/version/installed.txt 2> /dev/null`
		if ! [ "$INSTL" == 1 ]; then
			if [ "$INSTL" == 0 ]; then
				clear
				echo -e $GREENB"AdAway was previously removed, but it's configurations were left in tact"$ENDCOLOR
				echo -e $GREEN"Would you still like to uninstall AdAway?"$ENDCOLOR
				echo
				echo -e $RED"[THIS WILL REMOVE ALL CONFIGURATIONS!]"$ENDCOLOR
				echo -e -n $BLUEB"$USER@AdAway $ "$ENDCOLOR
				read "ANS"
				if [[ "$ANS" == [Yy] ]] || [ $ANS == 'YES' ] || [ $ANS == 'Yes' ] || [ $ANS == 'yes' ]; then
					HOSTD=`grep -Po "127.0.1.1 $HOSTNAME" ~/.adaway/backup/hosts`
					if [ "$HOSTD" == "127.0.1.1 $HOSTNAME" ]; then
						sudo cp -f ~/.adaway/backup/hosts /etc/hosts
					fi
					sudo rm -rf /usr/local/bin/adaway
					DIALOGRC=`cat ~/.adaway/files/config/dialogrc.cfg`
					if [[ DIALOGRC == "0" ]]; then
						sudo rm -rf ~/.dialogrc
					fi
					sudo rm -rf ~/.adaway
					clear
					echo -e $GREENB"Junk configuration files successfully removed!"$ENDCOLOR
					echo -e $GREEN"Press the any key to exit"$ENDCOLOR
					read
					clear
					exit
				else
					clear
					echo -e $RED'Cleaning up, then Exiting installer [4]'$ENDCOLOR
					sleep 1
					clear
					echo -e $RED'Cleaning up, then Exiting installer [3]'$ENDCOLOR
					sleep 1
					clear
					echo -e $RED'Cleaning up, then Exiting installer [2]'$ENDCOLOR
					sleep 1
					clear
					echo -e $RED'Cleaning up, then Exiting installer [1]'$ENDCOLOR
					sleep 1
					clear
				fi
			else
				clear
				echo -e $GREENB"AdAway is not installed on your computer!"$ENDCOLOR
				echo -e $GREEN"Press any key to exit"$ENDCOLOR
				read
				clear
				exit
			fi
		else
			TST=`adaway --version | grep -Po "AdAway v" 2> /dev/null`
			if [[ "$TST" == "AdAway v" ]]; then
				sudo cp -f ~/.adaway/backup/hosts /etc/hosts
				sudo rm -rf /usr/local/bin/adaway
				sudo rm -rf ~/.adaway
				clear
				echo -e $GREENB"AdAway has been uninstalled successfully."$ENDCOLOR
				echo -e $GREEN"Press the ENTER key to exit"$ENDCOLOR
				read
				clear
				exit
			else
				clear
				echo -e $GREENB"AdAway configuration files have been detected, but, AdAway binary is missing."$ENDCOLOR
				echo -e $GREEN"Would you like to remove the junk fragments of AdAway found on your computer?"$ENDCOLOR
				echo
				echo -e $RED"[THIS WILL REMOVE ALL PRIOR CONFIGURATIONS!]"$ENDCOLOR
				echo -e -n $BLUEB"$USER@AdAway $ "$ENDCOLOR
				read "ANS"
				if [[ "$ANS" == [Yy] ]] || [ $ANS == 'YES' ] || [ $ANS == 'Yes' ] || [ $ANS == 'yes' ]; then
					HOSTD=`grep -Po "127.0.1.1 $HOSTNAME" ~/.adaway/backup/hosts`
					if [ "$HOSTD" == "127.0.1.1 $HOSTNAME" ]; then
						sudo cp -f ~/.adaway/backup/hosts /etc/hosts
					fi
					sudo rm -rf /usr/local/bin/adaway
					DIALOGRC=`cat ~/.adaway/files/config/dialogrc.cfg`
					if [[ DIALOGRC == "0" ]]; then
						sudo rm -rf ~/.dialogrc
					fi
					sudo rm -rf ~/.adaway
					clear
					echo -e $GREENB"Junk configuration files successfully removed!"$ENDCOLOR
					echo -e $GREEN"Press the any key to exit"$ENDCOLOR
					read
					clear
					exit
				else
					clear
					echo -e $RED'Cleaning up, then Exiting installer [4]'$ENDCOLOR
					sleep 1
					clear
					echo -e $RED'Cleaning up, then Exiting installer [3]'$ENDCOLOR
					sleep 1
					clear
					echo -e $RED'Cleaning up, then Exiting installer [2]'$ENDCOLOR
					sleep 1
					clear
					echo -e $RED'Cleaning up, then Exiting installer [1]'$ENDCOLOR
					sleep 1
					clear
				fi
			fi
		fi
	fi
fi
if [[ $ANS == [Ee] ]]; then
	exit
fi
