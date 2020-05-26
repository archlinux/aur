# Installation Guide

Author: Celogeek <private-4zokpdq6@mrhyde.xyz>

## Requirement

 - jitsi-meet-stable
 - coturn
 - prosody
 - nginx

## Configure jitsi-meet

We will configure jitsi with prosody.

### /etc/jitsi/jicofo

#### config

1. Change the domain "jitsi-meet.example.org" with "YOUR_DOMAIN".

2. Generate random passwords for the component focus and the user focus@auth.YOUR_DOMAIN

```
openssl rand -hex 24
```

Replace the passwords for JICOFO_SECRET and JICOFO_AUTH_DOMAIN

#### sip-communicator.properties

Change the domain "jitsi-meet.example.org" with "YOUR_DOMAIN".

If you want to listen only on localhost for the health check (port 8888), add this:

```
org.jitsi.jicofo.auth.jetty.host=127.0.0.1
```

If you want to allow only the host to create new root, add authentification like this:
```
org.jitsi.jicofo.auth.URL=XMPP:YOUR_DOMAIN
```

### /etc/jitsi/videobridge

#### config

1. Change the domain "jitsi-meet.example.org" with "YOUR_DOMAIN".

2. Generate a random password for the component focus and the user jvb@auth.YOUR_DOMAIN

Replace the password for JVB_SECRET

#### sip communicator

1. Change the domain "jitsi-meet.example.org" with "YOUR_DOMAIN".

2. Replace org.jitsi.videobridge.xmpp.user.shard.PASSWORD with the JVB_SECRET you set in the config file

3. Generate a random uuid for MUC_NICKNAME

You can use "uuidgen" command for that

### /etc/jitsi/meet

#### config.js

1. Change the domain "jitsi-meet.example.com" with "YOUR_DOMAIN".

2. [optional] acticate stun/turn to allow connexion with 2 peers with block networks

In p2p:
    - useStunTurn: true (remove the //)
    - stunServers: uncomment your own server and comment the meet-jit-si-turnrelay to use your own server only

So p2p will look like:
```
    p2p: {
        enabled: true,
        useStunTurn: true,
        stunServers: [
            { urls: 'stun:jitsi-meet.example.com:3478' },
            //{ urls: 'stun:meet-jit-si-turnrelay.jitsi.net:443' }
        ],
        preferH264: true
    },
```

3. [optional] uncomment in hosts "anonymousdomain" and set your guest.YOUR_DOMAIN:

```
hosts: {
    domain: 'jitsi-meet.example.com',
    anonymousdomain: 'guest.jitsi-meet.example.com',
}
```

4. [optional] if you want to use websocket instead of long pooling request

uncomment websocket: 'wss://jitsi-meet.example.com/xmpp-websocket'

5. [optional] if you want to use IPV6

uncomment useIPv6: true

## configure prosody

### install deps

  - lua52
  - lua52-sec
  - lua52-event (aur)
  - lua52-zlib (aur)

### copy the example

```
cd /etc/prosody
mkdir conf.d
cp /usr/share/doc/jitsi/meet/prosody/prosody.cfg.lua-jvb.example conf.d/jitsi.cfg.lua
```

### include this conf in prosody.cfg.lua

At the end of the file add:
```
Include "conf.d/*.cfg.lua"
```

### [optional] listen to localhost only

At the beginning of the file add:
```
interfaces = {'127.0.0.1', '::1'}
https_ports = {};
https_interfaces = {};
c2s_require_encryption = false
```

### edit conf.d/jitsi.cfg.lua

1. Install the deps

1. Change the plugin_paths

```
plugin_paths = { "/usr/share/jitsi-meet-prosody-plugins/" }
```

2. a. Change the domain "jitmeet.example.com" with "YOUR_DOMAIN".

2. b. Change "focusUser" to "focus"

3. Set a random password to "turncredentials_secret" and credential host/port

```
turncredentials_secret = "YOUR_TURN_CREDENTIAL";

turncredentials = {
  { type = "stun", host = "YOUR_DOMAIN", port = "3478" },
  { type = "turn", host = "YOUR_DOMAIN", port = "3478", transport = "udp" },
  { type = "turns", host = "YOUR_DOMAIN", port = "3478", transport = "tcp" }
};
```

4. Replace the focus password in the Component "focus.YOUR_DOMAIN" with the jicofo config "JICOFO_SECRET"

5. [optional] activate websocket

Add this config before VirtualHost "YOUR_DOMAIN":

```
consider_websocket_secure = true;
cross_domain_websocket = true;

smacks_max_unacked_stanzas = 5;
smacks_hibernation_time = 60;
smacks_max_hibernated_sessions = 1;
smacks_max_old_sessions = 1;
```

Activate the websocket modules in modules_enabled of the VirtualHost "YOUR_DOMAIN":

```
modules_enabled = {
    "bosh";
    "pubsub";
    "websocket";
    "smacks";
    "ping"; -- Enable mod_ping
    "speakerstats";
    "turncredentials";
    "conference_duration";
}
```

6. [optional] only allow registered user to create a room

In VirtualHost "YOUR_DOMAIN":

```
authentification = "internal_plain"
```

After the VirtualHost "YOUR_DOMAIN" config add:
```
VirtualHost "YOUR_DOMAIN"
    authentication = "anonymous"
    c2s_require_encryption = false
    modules_enabled = {
        "turncredentials";
    }
```

7. ssl generation

If you want to active ssl encryption, you need a certificate.

**Self-signed certificate**

```
sudo -u prosody prosodyctl cert generate YOUR_DOMAIN
sudo -u prosody prosodyctl cert generate auth.YOUR_DOMAIN
trust anchor /var/lib/prosody/YOUR_DOMAIN.crt
trust anchor /var/lib/prosody/auth.YOUR_DOMAIN.crt
```

Then point change the config with:
```
VirtualHost "YOUR_DOMAIN"
        ssl = {
                key = "/var/lib/prosody/YOUR_DOMAIN.key";
                certificate = "/var/lib/prosody/YOUR_DOMAIN.crt";
        }

VirtualHost "auth.YOUR_DOMAIN"
        ssl = {
                key = "/var/lib/prosody/auth.YOUR_DOMAIN.key";
                certificate = "/var/lib/prosody/auth.YOUR_DOMAIN.crt";
        }
```

**Import LetEncrypt**

A method to get your certificate is above on nginx config section.

```
/usr/bin/prosodyctl --root cert import /etc/letsencrypt/live
```

Then point change the config with:
```
VirtualHost "YOUR_DOMAIN"
        ssl = {
                key = "/etc/prosody/certs/YOUR_DOMAIN.key";
                certificate = "/etc/prosody/certs/YOUR_DOMAIN.crt";
        }

VirtualHost "internal.auth.YOUR_DOMAIN"
        ssl = {
                key = "/etc/prosody/certs/auth.YOUR_DOMAIN.key";
                certificate = "/etc/prosody/certs/auth.YOUR_DOMAIN.crt";
        }
```

You can place this in "/etc/letsencrypt/renewal-hooks/deploy/jitsi.sh" in order to update it on each renew of the certificate


### Start prosody

```
systemctl start prosody
```

### Create user in prosody for jvb and focus

```
prosodyctl register jvb auth.YOUR_DOMAIN JVB_SECRET
prosodyctl register focus auth.YOUR_DOMAIN JICOFO_AUTH_PASSWORD
```

## Start jicofo/videobridge

```
systemctl start jicofo
systemctl start jitsi-videobridge
```

## [optional] Configure coturn/turnserver

```
cp /usr/share/doc/jitsi/meet/turn/turnserver.conf /etc/turnserver/turnserver.conf
```

1. Change static-auth-secret with the turncredential you put in prosody
2. Set the realm to YOUR_DOMAIN
3. Change the cert to

```
cert=/etc/turnserver/certs/cert.pem
pkey=/etc/turnserver/certs/pkey.pem
```

4. limit turn, increase security

Your config should look like:
```
use-auth-secret
static-auth-secret=YOUR_TURN_CREDENTIAL_IN_PROSODY
realm=YOUR_DOMAIN
cert=/etc/turnserver/certs/cert.pem
pkey=/etc/turnserver/certs/pkey.pem
syslog
pidfile=/run/turnserver/turnserver.pid
no-cli
keep-address-family

listening-ip=PUBLIC_IPV4_OF_YOUR_SERVER
listening-ip=PUBLIC_IPV6_OF_YOUR_SERVER
relay-ip=PUBLIC_IPV4_OF_YOUR_SERVER
relay-ip=PUBLIC_IPV6_OF_YOUR_SERVER

no-multicast-peers
mobility
stale-nonce

no-sslv3
no-tlsv1
```

Then you need to copy your SSL for turnserver:

**Letsencrypt**

/etc/letsencrypt/renewal-hooks/deploy/turn.sh:
```
#!/bin/sh
### turnserver
/usr/bin/install -d -m770 -o turnserver -g turnserver /etc/turnserver/certs
/usr/bin/install    -m640 -o turnserver -g turnserver /etc/letsencrypt/live/YOUR_DOMAIN/fullchain.pem /etc/turnserver/certs/cert.pem
/usr/bin/install    -m600 -o turnserver -g turnserver /etc/letsencrypt/live/YOUR_DOMAIN/privkey.pem /etc/turnserver/certs/pkey.pem
/bin/systemctl restart turnserver.service
```

In order to test p2p turn, you can force it in the jitsi config:

/etc/jitsi/meet/config.js:
```
    p2p: {
        enabled: true,
        useStunTurn: true,
        stunServers: [
            { urls: 'stun:YOUR_DOMAIN:3478' },
        ],
        iceTransportPolicy: 'relay', // this parameters force the turn mode
        preferH264: true
    },
```


## Configure NGINX


### get example
```
cd /etc/nginx
mkdir sites
cp /usr/share/doc/jitsi/meet/web/jitsi-meet.example sites/jitsi.conf
```

### include conf in nginx.conf

At the end of the files inside the http {}

```
http {
    ...

    include sites/*.conf;
}
```

### configure sites/jitsi.conf

1. Change the domain "jitsi-meet.example.org" with "YOUR_DOMAIN".
2. Change /etc/jitsi/meet/YOUR_DOMAIN-config.js by /etc/jitsi/meet/config.js
3. Setup your SSL path. Use letencrypt to get a valid certificate.

```
  ssl_certificate /etc/letsencrypt/live/YOUR_DOMAIN/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/YOUR_DOMAIN/privkey.pem;
```
4. generate letsencrypt ssl

```
pacman -S letsencrypt
certbot register
certbot certonly
# choose standalone
# feed YOUR_DOMAIN
certbot certonly
# choose standalone
# feed auth.YOUR_DOMAIN
```

### Add wasm mimetypes support

in /etc/nginx/mime.types, at the end, before the "}":

```
application/wasm    				wasm;
```

5. start nginx

```
nginx -t # check if all good
systemctl start nginx
```

