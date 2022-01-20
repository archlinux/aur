# Changelog

- SSH (`ssh`)
  - Public Keys (`pubkeys`)
    - add [public key](https://datatracker.ietf.org/doc/html/rfc4253#section-6.6) related classes (\#43)
  - Versions (`versions`)
    - add [software version](https://tools.ietf.org/html/rfc4253#section-4.2) related classes (\#46)

## 0.7.3 - 2021-12-26

- Generic
  - Fix time zone handlind in datetime parser

## 0.7.2 - 2021-10-07

### Other

- switch to Markdown format in changelog, readme and contributing
- update contributing to the latest version from contribution-guide.org

## 0.7.1 - 2021-09-20

- TLS (`tls`)
  - protocol item classes for RDP support (\#44)

## 0.7.0 - 2021-09-02

- TLS (`tls`)
  - Extensions (`extensions`)
    - add [application-layer protocol negotiation](https://www.rfc-editor.org/rfc/rfc5077.html) extension related
      messages (\#40)
    - add [encrypt-then-MAC](https://www.rfc-editor.org/rfc/rfc7366.html) extension related messages (\#40)
    - add [extended master secret](https://www.rfc-editor.org/rfc/rfc7627.html) extension related messages (\#40)
    - add [next protocol negotiation](https://tools.ietf.org/id/draft-agl-tls-nextprotoneg-03.html) extension related
      messages (\#40)
    - add [renegotiation indication](https://www.rfc-editor.org/rfc/rfc5746.html) extension related messages (\#40)
    - add [session ticket](https://www.rfc-editor.org/rfc/rfc5077.html) extension related messages (\#40)

## 0.6.0 - 2021-05-27

### Features

- HTTP(S) (`http`)
  - Headers (`headers`)
    - supports header wire format parsing
    - add parsers for generic headers
      ([Content-Type](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Type),
      [Server](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Server))
    - add parsers for cache related headers ([Age](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Age),
      [Cache-Control](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cache-Control),
      [Date](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Date),
      [ETag](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/ETag),
      [Expires](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Expires),
      [Last-Modified](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Last-Modified),
      [Pragma](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Pragma))
    - add parsers for security related headers
      ([Expect-CT](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Expect-CT),
      [Expect-Staple](https://scotthelme.co.uk/designing-a-new-security-header-expect-staple),
      [Referrer-Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Referrer-Policy),
      [Strict-Transport-Security](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Strict-Transport-Security),
      [X-Content-Type-Options](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Content-Type-Options),
      [X-Frame-Options](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options))
- TLS (`tls`)
  - Versions (`versions`)
    - add [protocol version 1.3](https://tools.ietf.org/html/rfc8446) related messages (\#20)
  - Cipher Suites (`ciphers`)
    - add [cipher suites](https://tools.ietf.org/html/rfc8446#appendix-B.4) relate to version 1.3 (\#20)
  - Diffie-Hellman (`dhparams`)
    - add [supported groups](https://tools.ietf.org/html/rfc8446#section-4.2.7) relate to version 1.3 (\#20)
  - Elliptic Curves (`curves`)
    - add [supported groups](https://tools.ietf.org/html/rfc8446#section-4.2.7) relate to version 1.3 (\#20)
  - Signature Algorithms (`sigalgos`)
    - add [signature algorithms](https://tools.ietf.org/html/rfc8446#section-4.2.3) relate to version 1.3 (\#20)

## 0.5.0 - 2021-04-08

### Features

- Generic
  - add parser for [text-based protocols](https://en.wikipedia.org/wiki/Text-based_protocol) (\#21)
- SSH (`ssh`)
  - Versions (`versions`)
    - add [protocol version exchange](https://tools.ietf.org/html/rfc4253#section-4.2) related messages (\#21)
- SSH 2.0 (`ssh2`)
  - Cipher Suites (`ciphers`)
    - add [algorithm negotiation](https://tools.ietf.org/html/rfc4253#section-7.1) related messages (\#21)

### Usability

- Generic
  - show attributes in user-friendly order in Markdown output (\#30)
  - use human readable algorithms names in Markdown output (\#32)
  - add human readable descriptions for exceptions (\#33)

## 0.4.0 - 2021-01-30

### Features

- TLS (`tls`)
  - Generic
    - add [LDAP](https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol) related messages (\#23)
  - Client Public Key Request (`pubkeyreq`)
    - add [client public key request](https://tools.ietf.org/html/rfc2246#section-7.4.4) related messages (\#24)

### Improvements

- Generic
  - add [OID](https://en.wikipedia.org/wiki/Object_identifier) to algorithms

## 0.3.1 - 2020-09-15

### Features

- Generic
  - [Markdown](https://en.wikipedia.org/wiki/Markdown) serializable format (\#19)

### Improvements

- TLS (`tls`)
  - Cipher Suites (`ciphers`)
    - add missing `ECDHE_PSK` cipher suites (\#7)
    - add [GOST](https://en.wikipedia.org/wiki/GOST) cipher suites
    - add missing draft ECC cipher suites (\#9)
    - add missing [FIPS](https://en.wikipedia.org/wiki/FIPS_140-2) cipher suites (\#11)
    - add [CECPQ1](https://en.wikipedia.org/wiki/CECPQ1) cipher suites (\#12)
    - add missing [Fortezza](https://en.wikipedia.org/wiki/Fortezza) cipher suites (\#13)
    - add missing `DHE` cipher suites (\#14)
    - add missing SSLv3 cipher suites (\#15)

### Notable fixes

- Generic
  - fix unicode string representation in JSON output (\#18)
- TLS (`tls`)
  - Cipher Suites (`ciphers`)
    - fix some cipher suite names and parameters (\#7, \#10)

## 0.3.0 - 2020-04-30

### Features

- TLS (`tls`)
  - protocol item classes for RDP support (\#4)
  - [JA3 fingerprint](https://engineering.salesforce.com/tls-fingerprinting-with-ja3-and-ja3s-247362855967) calculation
    for TLS client hello (\#2)

#### Bugs

- TLS (`tls`)
  - compose all the messages in case of a TLS record (\#1)

### Refactor

- use attrs to avoid boilerplates (\#3)

## 0.2.0 - 2019-12-02

### Notable fixes

- clarify TLS related parameter names
- several packaging fixes

## 0.1.0 - 2019-03-20

### Features

- added TLS record protocol support
- added TLS ChangeCipherSpec message support
- added TLS ApplicationData message support
- added TLS handshake message support
- added TLS client
- added SSL support

### Improvements

- added serialization support for classes
- added elliptic-curve related descriptive classes
- added timeout parameter to TLS client class
