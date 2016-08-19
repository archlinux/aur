/* config.h.  Generated from config.h.in by configure.  */
/* config.h.in.  Generated from configure.ac by autoheader.  */

/* Debug Mode */
/* #undef DEBUG */

/* Define to 1 if you have the declaration of `PRIi16', and to 0 if you don't.
   */
#define HAVE_DECL_PRII16 1

/* Define to 1 if you have the declaration of `PRIi32', and to 0 if you don't.
   */
#define HAVE_DECL_PRII32 1

/* Define to 1 if you have the declaration of `PRIi64', and to 0 if you don't.
   */
#define HAVE_DECL_PRII64 1

/* Define to 1 if you have the declaration of `PRIi8', and to 0 if you don't.
   */
#define HAVE_DECL_PRII8 1

/* Define to 1 if you have the declaration of `PRIu16', and to 0 if you don't.
   */
#define HAVE_DECL_PRIU16 1

/* Define to 1 if you have the declaration of `PRIu32', and to 0 if you don't.
    */
#define HAVE_DECL_PRIU32 1

/* Define to 1 if you have the declaration of `PRIu64', and to 0 if you don't.
   */
#define HAVE_DECL_PRIU64 1

/* Define to 1 if you have the declaration of `PRIu8', and to 0 if you don't.
   */
#define HAVE_DECL_PRIU8 1

/* Define to 1 if you have the <android/log.h> header file. */
/* #undef HAVE_ANDROID_LOG_H */

/* Define to 1 if you have the `clock_gettime' function. */
#define HAVE_CLOCK_GETTIME 1

/* Define to 1 if you have the <CoreBluetooth/CoreBluetooth.h> header file. */
/* #undef HAVE_COREBLUETOOTH_COREBLUETOOTH_H */

/* Define to 1 if you have the declaration of `MSG_NOSIGNAL', and to 0 if you
   don't. */
#ifdef __linux__
#  define HAVE_DECL_MSG_NOSIGNAL 1
#else
#  define HAVE_DECL_MSG_NOSIGNAL 0
#endif

/* Define to 1 if you have the declaration of `SO_NOSIGPIPE', and to 0 if you
   don't. */
#ifdef __linux__
#  define HAVE_DECL_SO_NOSIGPIPE 0
#else
#  define HAVE_DECL_SO_NOSIGPIPE 1
#endif

/* Define to 1 if you have the declaration of `CLOCK_MONOTONIC', and to 0 if
   you don't. */
#ifdef __linux__
#  define HAVE_DECL_CLOCK_MONOTONIC 1
#else
#  define HAVE_DECL_CLOCK_MONOTONIC 0
#endif

/* Define to 1 if you have the declaration of `CLOCK_REALTIME', and to 0 if
   you don't. */
#ifdef __linux__
#  define HAVE_DECL_CLOCK_REALTIME 1
#else
#  define HAVE_DECL_CLOCK_REALTIME 0
#endif

/* Define to 1 if you have the declaration of `log2', and to 0 if you don't.
 */
#define HAVE_DECL_LOG2 1

/* Define to 1 if you have the declaration of `SYS_gettid', and to 0 if you
   don't. */
#define HAVE_DECL_SYS_GETTID 1

/* Define to 1 if you have the <dlfcn.h> header file. */
#define HAVE_DLFCN_H 1

/* Define to 1 if you have the <ftw.h> header file. */
#define HAVE_FTW_H 1

/* Define to 1 if you have the `gettimeofday' function. */
#define HAVE_GETTIMEOFDAY 1

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* Whether the libm on the host has the log2 function */
#define HAVE_LOG2 1

/* Define to 1 if you have the <memory.h> header file. */
#define HAVE_MEMORY_H 1

/* Define to 1 if you have the <netinet/in.h> header file. */
#define HAVE_NETINET_IN_H 1

/* Define to 1 if you have the <pthread.h> header file. */
#define HAVE_PTHREAD_H 1

/* Define to 1 if you have the <semaphore.h> header file. */
#define HAVE_SEMAPHORE_H 1

/* Define to 1 if you have the `sem_destroy' function. */
#define HAVE_SEM_DESTROY 1

/* Define to 1 if you have the `sem_getvalue' function. */
#define HAVE_SEM_GETVALUE 1

/* Define to 1 if you have the `sem_init' function. */
#define HAVE_SEM_INIT 1

/* Define to 1 if you have the `sem_post' function. */
#define HAVE_SEM_POST 1

/* Define to 1 if you have the `sem_timedwait' function. */
#ifdef __linux__
#  define HAVE_SEM_TIMEDWAIT 1
#endif

/* Define to 1 if you have the `sem_trywait' function. */
#define HAVE_SEM_TRYWAIT 1

/* Define to 1 if you have the `sem_wait' function. */
#define HAVE_SEM_WAIT 1

/* Define to 1 if you have the <stdarg.h> header file. */
#define HAVE_STDARG_H 1

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdio.h> header file. */
#define HAVE_STDIO_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the <strings.h> header file. */
#define HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the <sys/socket.h> header file. */
#define HAVE_SYS_SOCKET_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/time.h> header file. */
#define HAVE_SYS_TIME_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define to 1 if you have the <sys/uio.h> header file. */
#define HAVE_SYS_UIO_H 1

/* Define to 1 if you have the `time' function. */
#define HAVE_TIME 1

/* Define to 1 if you have the <time.h> header file. */
#define HAVE_TIME_H 1

/* Define to 1 if you have the <unistd.h> header file. */
#define HAVE_UNISTD_H 1

/* Define to 1 if you have the <sys/statfs.h> header file. */
#ifdef __linux__
#  define HAVE_SYS_STATFS_H 1
#endif

/* Define to 1 if you have the <sys/mount.h> header file. */
#define HAVE_SYS_MOUNT_H 1

/* No-debug Mode */
#define NDEBUG /**/

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* Define to 1 if you have the <sys/mount.h> header file. */
#define HAVE_SYS_MOUNT_H 1

/* Define to 1 if you have the <UIKit/UIKit.h> header file. */
/* #undef HAVE_UIKIT_UIKIT_H */
/* Define to `unsigned int' if <sys/types.h> does not define. */
/* #undef size_t */
