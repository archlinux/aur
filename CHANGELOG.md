# Confluent's Python client for Apache Kafka

## v2.4.0

v2.4.0 is a feature release with the following features, fixes and enhancements:

 - [KIP-848](https://cwiki.apache.org/confluence/display/KAFKA/KIP-848%3A+The+Next+Generation+of+the+Consumer+Rebalance+Protocol): Added KIP-848 based new consumer group rebalance protocol. The feature is an **Early Access**: not production ready yet. Please refer [detailed doc](https://github.com/confluentinc/librdkafka/blob/master/INTRODUCTION.md#next-generation-of-the-consumer-group-protocol-kip-848) for more information.
 - Fix segfault with describe_topics and flaky connection (@lpsinger, #1692)

confluent-kafka-python is based on librdkafka v2.4.0, see the
[librdkafka release notes](https://github.com/confluentinc/librdkafka/releases/tag/v2.4.0)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v2.3.0

v2.3.0 is a feature release with the following features, fixes and enhancements:

 - Add Python 3.12 wheels
 - [KIP-117](https://cwiki.apache.org/confluence/display/KAFKA/KIP-117%3A+Add+a+public+AdminClient+API+for+Kafka+admin+operations): Add support for AdminAPI `describe_cluster()` and `describe_topics()`. (@jainruchir, #1635)
 - [KIP-430](https://cwiki.apache.org/confluence/display/KAFKA/KIP-430+-+Return+Authorized+Operations+in+Describe+Responses):
   Return authorized operations in Describe Responses. (@jainruchir, #1635)
 - [KIP-516](https://cwiki.apache.org/confluence/display/KAFKA/KIP-516%3A+Topic+Identifiers): Partial support of topic identifiers. Topic identifiers in metadata response are available through the new describe_topics function (#1645).
 - [KIP-396](https://cwiki.apache.org/confluence/pages/viewpage.action?pageId=97551484): completed the implementation with the addition of `list_offsets` (#1576).
 - Add `Rack` to the `Node` type, so AdminAPI calls can expose racks for brokers
   (currently, all Describe Responses) (#1635, @jainruchir).
 - Fix the Describe User Scram Credentials for Describe all users or empty users list. Please refer to
   issue(https://github.com/confluentinc/confluent-kafka-python/issues/1616) for more details (#1630).

confluent-kafka-python is based on librdkafka v2.3.0, see the
[librdkafka release notes](https://github.com/confluentinc/librdkafka/releases/tag/v2.3.0)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v2.2.0

v2.2.0 is a feature release with the following features, fixes and enhancements:

 - [KIP-339](https://cwiki.apache.org/confluence/display/KAFKA/KIP-339%3A+Create+a+new+IncrementalAlterConfigs+API)
   IncrementalAlterConfigs API (#1517).
 - [KIP-554](https://cwiki.apache.org/confluence/display/KAFKA/KIP-554%3A+Add+Broker-side+SCRAM+Config+API):
   User SASL/SCRAM credentials alteration and description (#1575).
 - Added documentation with an example of FIPS compliant communication with Kafka cluster.
 - Fixed wrong error code parameter name in KafkaError.

confluent-kafka-python is based on librdkafka v2.2.0, see the
[librdkafka release notes](https://github.com/confluentinc/librdkafka/releases/tag/v2.2.0)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v2.1.1

v2.1.1 is a maintenance release with the following fixes and enhancements:

### Fixes

- Added a new ConsumerGroupState UNKNOWN. The typo state UNKOWN is deprecated and will be removed in the next major version.
- Fix some Admin API documentation stating -1 for infinite timeout incorrectly.
  Request timeout can't be infinite.

confluent-kafka-python is based on librdkafka v2.1.1, see the
[librdkafka release notes](https://github.com/edenhill/librdkafka/releases/tag/v2.1.1)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v2.1.0

v2.1.0 is a feature release with the following features, fixes and enhancements:

- Added `set_sasl_credentials`. This new method (on the Producer, Consumer, and AdminClient) allows modifying the stored
  SASL PLAIN/SCRAM credentials that will be used for subsequent (new) connections to a broker (#1511).
- Wheels for Linux / arm64 (#1496).
- Added support for Default num_partitions in CreateTopics Admin API.
- Added support for password protected private key in CachedSchemaRegistryClient.
- Add reference support in Schema Registry client. (@RickTalken, #1304)
- Migrated travis jobs to Semaphore CI (#1503)
- Added support for schema references. (#1514 and @slominskir #1088)
- [KIP-320](https://cwiki.apache.org/confluence/display/KAFKA/KIP-320%3A+Allow+fetchers+to+detect+and+handle+log+truncation):
  add offset leader epoch methods to the TopicPartition and Message classes (#1540).

confluent-kafka-python is based on librdkafka v2.1.0, see the
[librdkafka release notes](https://github.com/edenhill/librdkafka/releases/tag/v2.1.0)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v2.0.2

v2.0.2 is a feature release with the following features, fixes and enhancements:

 - Added Python 3.11 wheels.
 - [KIP-222](https://cwiki.apache.org/confluence/display/KAFKA/KIP-222+-+Add+Consumer+Group+operations+to+Admin+API)
   Add Consumer Group operations to Admin API.
 - [KIP-518](https://cwiki.apache.org/confluence/display/KAFKA/KIP-518%3A+Allow+listing+consumer+groups+per+state)
   Allow listing consumer groups per state.
 - [KIP-396](https://cwiki.apache.org/confluence/pages/viewpage.action?pageId=97551484)
   Partially implemented: support for AlterConsumerGroupOffsets.
 - As result of the above KIPs, added (#1449)
   - `list_consumer_groups` Admin operation. Supports listing by state.
   - `describe_consumer_groups` Admin operation. Supports multiple groups.
   - `delete_consumer_groups` Admin operation. Supports multiple groups.
   - `list_consumer_group_offsets` Admin operation. Currently, only supports 1 group with multiple partitions. Supports require_stable option.
   - `alter_consumer_group_offsets` Admin operation. Currently, only supports 1 group with multiple offsets.
 - Added `normalize.schemas` configuration property to Schema Registry client (@rayokota, #1406)
 - Added metadata to `TopicPartition` type and `commit()` (#1410).
 - Added `consumer.memberid()` for getting member id assigned to
   the consumer in a consumer group (#1154).
 - Implemented `nb_bool` method for the Producer, so that the default (which uses len)
   will not be used. This avoids situations where producers with no enqueued items would
   evaluate to False (@vladz-sternum, #1445).
 - Deprecated `AvroProducer` and `AvroConsumer`. Use `AvroSerializer` and `AvroDeserializer` instead.
 - Deprecated `list_groups`. Use `list_consumer_groups` and `describe_consumer_groups` instead.
 - Improved Consumer Example to show atleast once semantics.
 - Improved Serialization and Deserialization Examples.
 - Documentation Improvements.

## Upgrade considerations

OpenSSL 3.0.x upgrade in librdkafka requires a major version bump, as some
 legacy ciphers need to be explicitly configured to continue working,
 but it is highly recommended NOT to use them. The rest of the API remains
 backward compatible.

confluent-kafka-python is based on librdkafka 2.0.2, see the
[librdkafka v2.0.0 release notes](https://github.com/edenhill/librdkafka/releases/tag/v2.0.0)
and later ones for a complete list of changes, enhancements, fixes and upgrade considerations.

**Note: There were no v2.0.0 and v2.0.1 releases.**

## v1.9.2

v1.9.2 is a maintenance release with the following fixes and enhancements:

 - Support for setting principal and SASL extensions in oauth_cb
   and handle failures (@Manicben, #1402)
 - Wheel for macOS M1/arm64
 - KIP-140 Admin API ACL fix:
   When requesting multiple create_acls or delete_acls operations,
   if the provided ACL bindings or ACL binding filters are not
   unique, an exception will be thrown immediately rather than later
   when the responses are read. (#1370).
 - KIP-140 Admin API ACL fix:
   Better documentation of the describe and delete ACLs behavior
   when using the MATCH resource patter type in a filter. (#1373).
 - Avro serialization examples:
   added a parameter for using a generic or specific Avro schema. (#1381).

confluent-kafka-python is based on librdkafka v1.9.2, see the
[librdkafka release notes](https://github.com/edenhill/librdkafka/releases/tag/v1.9.2)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v1.9.1

There was no 1.9.1 release of the Python Client.


## v1.9.0

This is a feature release:

 - OAUTHBEARER OIDC support
 - KIP-140 Admin API ACL support

### Fixes

 - The warnings for `use.deprecated.format` (introduced in v1.8.2)
   had its logic reversed, which result in warning logs to be emitted when
   the property was correctly configured, and the log message itself also
   contained text that had it backwards.
   The warning is now only emitted when `use.deprecated.format` is set
   to the old legacy encoding (`True`). #1265
 - Use `str(Schema)` rather than `Schema.to_json` to prevent fastavro
   from raising exception `TypeError: unhashable type: 'mappingproxy'`.
   (@ffissore, #1156, #1197)
 - Fix the argument order in the constructor signature for
   AvroDeserializer/Serializer: the argument order in the constructor
   signature for AvroDeserializer/Serializer was altered in v1.6.1, but
   the example is not changed yet. (@DLT1412, #1263)
 - Fix the json deserialization errors from `_schema_loads` for
   valid primitive declarations. (@dylrich, #989)

confluent-kafka-python is based on librdkafka v1.9.0, see the
[librdkafka release notes](https://github.com/edenhill/librdkafka/releases/tag/v1.9.0)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v1.8.2

v1.8.2 is a maintenance release with the following fixes and enhancements:

 - **IMPORTANT**: Added mandatory `use.deprecated.format` to
   `ProtobufSerializer` and `ProtobufDeserializer`.
   See **Upgrade considerations** below for more information.
 - **Python 2.7 binary wheels are no longer provided.**
   Users still on Python 2.7 will need to build confluent-kafka from source
   and install librdkafka separately, see [README.md](README.md#Prerequisites)
   for build instructions.
 - Added `use.latest.version` and `skip.known.types` (Protobuf) to
   the Serializer classes. (Robert Yokota, #1133).
 - `list_topics()` and `list_groups()` added to AdminClient.
 - Added support for headers in the SerializationContext (Laurent Domenech-Cabaud)
 - Fix crash in header parsing (Armin Ronacher, #1165)
 - Added long package description in setuptools (Bowrna, #1172).
 - Documentation fixes by Aviram Hassan and Ryan Slominski.
 - Don't raise AttributeError exception when CachedSchemaRegistryClient
   constructor raises a valid exception.

confluent-kafka-python is based on librdkafka v1.8.2, see the
[librdkafka release notes](https://github.com/edenhill/librdkafka/releases/tag/v1.8.2)
for a complete list of changes, enhancements, fixes and upgrade considerations.

**Note**: There were no v1.8.0 and v1.8.1 releases.


## Upgrade considerations

### Protobuf serialization format changes

Prior to this version the confluent-kafka-python client had a bug where
nested protobuf schemas indexes were incorrectly serialized, causing
incompatibility with other Schema-Registry protobuf consumers and producers.

This has now been fixed, but since the old defect serialization and the new
correct serialization are mutually incompatible the user of
confluent-kafka-python will need to make an explicit choice which
serialization format to use during a transitory phase while old producers and
consumers are upgraded.

The `ProtobufSerializer` and `ProtobufDeserializer` constructors now
both take a (for the time being) configuration dictionary that requires
the `use.deprecated.format` configuration property to be explicitly set.

Producers should be upgraded first and as long as there are old (<=v1.7.0)
Python consumers reading from topics being produced to, the new (>=v1.8.2)
Python producer must be configured with `use.deprecated.format` set to `True`.

When all existing messages in the topic have been consumed by older consumers
the consumers should be upgraded and both new producers and the new consumers
must set `use.deprecated.format` to `False`.


The requirement to explicitly set `use.deprecated.format` will be removed
in a future version and the setting will then default to `False` (new format).






## v1.7.0

v1.7.0 is a maintenance release with the following fixes and enhancements:

- Add error_cb to confluent_cloud.py example (#1096).
- Clarify that doc output varies based on method (@slominskir, #1098).
- Docs say Schema when they mean SchemaReference (@slominskir, #1092).
- Add documentation for NewTopic and NewPartitions (#1101).

confluent-kafka-python is based on librdkafka v1.7.0, see the
[librdkafka release notes](https://github.com/edenhill/librdkafka/releases/tag/v1.7.0)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v1.6.1

v1.6.1 is a feature release:

 - KIP-429 - Incremental consumer rebalancing support.
 - OAUTHBEARER support.

### Fixes

 - Add `return_record_name=True` to AvroDeserializer (@slominskir, #1028)
 - Fix deprecated `schema.Parse` call (@casperlehmann, #1006).
 - Make reader schema optional in AvroDeserializer (@97nitt, #1000).
 - Add `**kwargs` to legacy AvroProducer and AvroConsumer constructors to
   support all Consumer and Producer base class constructor arguments, such
   as `logger` (@venthur, #699).
 - Add bool for permanent schema delete (@slominskir, #1029).
 - The avro package is no longer required for Schema-Registry support (@jaysonsantos, #950).
 - Only write to schema cache once, improving performance (@fimmtiu, #724).
 - Improve Schema-Registry error reporting (@jacopofar, #673).
 - `producer.flush()` could return a non-zero value without hitting the
   specified timeout.


confluent-kafka-python is based on librdkafka v1.6.1, see the
[librdkafka release notes](https://github.com/edenhill/librdkafka/releases/tag/v1.6.1)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v1.6.0

v1.6.0 is a feature release with the following features, fixes and enhancements:

 - Bundles librdkafka v1.6.0 which adds support for Incremental rebalancing,
   Sticky producer partitioning, Transactional producer scalabilty improvements,
   and much much more. See link to release notes below.
 - Rename asyncio.py example to avoid circular import (#945)
 - The Linux wheels are now built with manylinux2010 (rather than manylinux1)
   since OpenSSL v1.1.1 no longer builds on CentOS 5. Older Linux distros may
   thus no longer be supported, such as CentOS 5.
 - The in-wheel OpenSSL version has been updated to 1.1.1i.
 - Added `Message.latency()` to retrieve the per-message produce latency.
 - Added trove classifiers.
 - Consumer destructor will no longer trigger consumer_close(),
   `consumer.close()` must now be explicitly called if the application
   wants to leave the consumer group properly and commit final offsets.
 - Fix `PY_SSIZE_T_CLEAN` warning
 - Move confluent_kafka/ to src/ to avoid pytest/tox picking up the local dir
 - Added `producer.purge()` to purge messages in-queue/flight (@peteryin21, #548)
 - Added `AdminClient.list_groups()` API (@messense, #948)
 - Rename asyncio.py example to avoid circular import (#945)

confluent-kafka-python is based on librdkafka v1.6.0, see the
[librdkafka release notes](https://github.com/edenhill/librdkafka/releases/tag/v1.6.0)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v1.5.2

v1.5.2 is a maintenance release with the following fixes and enhancements:

 - Add producer purge method with optional blocking argument (@peteryin21, #548)
 - Add AdminClient.list_groups API (@messense, #948)
 - Rename asyncio.py example to avoid circular import (#945)
 - Upgrade bundled OpenSSL to v1.1.1h (from v1.0.2u)
 - The Consumer destructor will no longer trigger `consumer.close()`
   callbacks, `consumer.close()` must now be explicitly called to cleanly
   close down the consumer and leave the group.
 - Fix `PY_SSIZE_T_CLEAN` warning in calls to produce().
 - Restructure source tree to avoid undesired local imports of confluent_kafka
   when running pytest.

confluent-kafka-python is based on librdkafka v1.5.2, see the
[librdkafka release notes](https://github.com/edenhill/librdkafka/releases/tag/v1.5.2)
for a complete list of changes, enhancements, fixes and upgrade considerations.


**Note: There was no v1.5.1 release**


## v1.5.0

v1.5.0 is a maintenance release with the following fixes and enhancements:

 - Bundles librdkafka v1.5.0 - see release notes for all enhancements and fixes.
 - Documentation fixes
 - [Dockerfile examples](examples/docker)
 - [List offsets example](examples/list_offsets.py)

confluent-kafka-python is based on librdkafka v1.5.0, see the
[librdkafka release notes](https://github.com/edenhill/librdkafka/releases/tag/v1.5.0)
for a complete list of changes, enhancements, fixes and upgrade considerations.

